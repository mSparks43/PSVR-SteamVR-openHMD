// Copyright 2013, Fredrik Hultin.
// Copyright 2013, Jakob Bornecrantz.
// Copyright 2016, Joey Ferwerda.
// SPDX-License-Identifier: BSL-1.0
/*
 * OpenHMD - Free and Open Source API and drivers for immersive technology.
 */

/* Sony PSVR Driver */


#define FEATURE_BUFFER_SIZE 256

#define TICK_LEN (1.0f / 1000000.0f) // 1 MHz ticks

#define SONY_ID                  0x054c
#define PSVR_HMD                 0x09af

#include <string.h>
#include <wchar.h>
#include <hidapi.h>
#include <assert.h>
#include <limits.h>
#include <stdint.h>
#include <stdbool.h>
#include <math.h>
#include "psvr.h"
#include "Simulation.h"
#include <time.h>
typedef struct {
	ohmd_device base;

	hid_device* hmd_handle;
	hid_device* hmd_control;
	fusion sensor_fusion;
	vec3f raw_accel, raw_gyro;
	uint8_t last_seq;
	uint8_t buttons;
	psvr_sensor_packet sensor;

} psvr_priv;

static void accel_from_psvr_vec(const int16_t* smp, vec3f* out_vec)
{
	out_vec->x = (float)smp[1] *  (10.0 / 16384);
	out_vec->y = (float)smp[0] *  (10.0 / 16384);
	out_vec->z = (float)smp[2] * -(10.0 / 16384);
}

static void gyro_from_psvr_vec(const int16_t* smp, vec3f* out_vec)
{
	out_vec->x = (float)smp[1] * 0.00105f;
	out_vec->y = (float)smp[0] * 0.00105f;
	out_vec->z = (float)smp[2] * 0.00105f * -1.0f;
}


static uint32_t calc_delta_and_handle_rollover(uint32_t next, uint32_t last)
{
	uint32_t tick_delta = next - last;

	// The 24-bit tick counter has rolled over,
	// adjust the "negative" value to be positive.
	if (tick_delta > 0xffffff) {
		tick_delta += 0x1000000;
	}

	return tick_delta;
}
int i=1;
/*static void handle_tracker_sensor_msg(psvr_priv* priv, unsigned char* buffer, int size)
{
	vec3f mag = {{0.0f, 0.0f, 0.0f}};
	float dt = i* TICK_LEN;
	i++;
	priv->sensor.proximity=1025;
	ofusion_update(&priv->sensor_fusion, dt, &priv->raw_gyro, &priv->raw_accel, &mag);
}*/

static void handle_tracker_sensor_msg(psvr_priv* priv, unsigned char* buffer, int size)
{
	

	if(!psvr_decode_sensor_packet(&priv->sensor, buffer, size)){
		LOGE("couldn't decode tracker sensor message");
		return;
	}
	uint32_t last_sample_tick = priv->sensor.samples[0].tick;
	psvr_sensor_packet* s = &priv->sensor;

	uint32_t tick_delta = 250;
	//if(start>-1){
	//	time_t milliseconds;
	//	milliseconds = clock();
	//	printf("%d %f\n", (milliseconds-start),priv->raw_gyro.y);
	//}
	// Startup correction, ignore last_sample_tick if zero.
	if (last_sample_tick > 0) {
		tick_delta = calc_delta_and_handle_rollover(
			s->samples[0].tick, last_sample_tick);

		// The PSVR device can buffer sensor data from previous
		// sessions which we can get at the start of new sessions.
		// @todo Maybe just skip the first 10 sensor packets?
		// @todo Maybe reset sensor fusion?
		//if (tick_delta > 500) 
		//	return;
		//printf("%d\n",tick_delta);
		if (tick_delta < 200 || tick_delta > 525) {
			//LOGD("tick_delta = %u", tick_delta);
			tick_delta = 500;
		}
	}

	vec3f mag = {{0.0f, 0.0f, 0.0f}};

	for (int i = 0; i < 2; i++) {
		float dt = tick_delta * TICK_LEN;
		accel_from_psvr_vec(s->samples[i].accel, &priv->raw_accel);
		gyro_from_psvr_vec(s->samples[i].gyro, &priv->raw_gyro);
		//printf("%f ",priv->raw_gyro.y);
		//printf("tick %d \n",s->samples[i].tick);
		priv->raw_gyro.y-=(float)(last_sample_tick)*0.0000000007f;
		
		//priv->raw_gyro.y-=(float)(last_sample_tick)*0.00000007f;
		//printf("%f\n",priv->raw_gyro.y);
		ofusion_update(&priv->sensor_fusion, dt, &priv->raw_gyro, &priv->raw_accel, &mag);

		if (i == 0) {
			tick_delta = calc_delta_and_handle_rollover(
				s->samples[1].tick, s->samples[0].tick);
		}
	}

	priv->buttons = s->buttons;
	//if(start<0)
	//	start = clock();
}

/*static void handle_tracker_sensor_msg(psvr_priv* priv, unsigned char* buffer, int size)
{
	uint32_t last_sample_tick = priv->sensor.tick;

	if(!psvr_decode_sensor_packet(&priv->sensor, buffer, size)){
		LOGE("couldn't decode tracker sensor message");
	}

	psvr_sensor_packet* s = &priv->sensor;

	uint32_t tick_delta = 1000;
	if(last_sample_tick > 0) //startup correction
		tick_delta = s->tick - last_sample_tick;

	float dt = tick_delta * TICK_LEN;
	vec3f mag = {{0.0f, 0.0f, 0.0f}};

	for(int i = 0; i < 1; i++){ //just use 1 sample since we don't have sample order for 	 frame
		vec3f_from_psvr_vec(s->samples[i].accel, &priv->raw_accel);
		vec3f_from_psvr_vec(s->samples[i].gyro, &priv->raw_gyro);

		ofusion_update(&priv->sensor_fusion, dt, &priv->raw_gyro, &priv->raw_accel, &mag);

		// reset dt to tick_len for the last samples if there were more than one sample
		dt = TICK_LEN;
	}
}*/

static void teardown(psvr_priv* priv)
{
	if (priv->hmd_handle != NULL) {
		hid_write(priv->hmd_control, psvr_cinematicmode_on, sizeof(psvr_cinematicmode_on));
		hid_close(priv->hmd_handle);
		priv->hmd_handle = NULL;
	}

	if (priv->hmd_control != NULL) {
		hid_close(priv->hmd_control);
		priv->hmd_control = NULL;
	}
	free(priv);
}

static void update_device(ohmd_device* device)
{
	psvr_priv* priv = (psvr_priv*)device;

	int size = 0;
	unsigned char buffer[FEATURE_BUFFER_SIZE];

	while(true){
		int size = hid_read(priv->hmd_handle, buffer, FEATURE_BUFFER_SIZE);
		if(size < 0){
			LOGE("error reading from device");
			return;
		} else if(size == 0) {
			return; // No more messages, return.
		}

		handle_tracker_sensor_msg(priv, buffer, size);
	}

	if(size < 0){
		LOGE("error reading from device");
	}
}

static int getf(ohmd_device* device, ohmd_float_value type, float* out)
{
	psvr_priv* priv = (psvr_priv*)device;

	switch(type){
	case OHMD_ROTATION_QUAT:
		*(quatf*)out = priv->sensor_fusion.orient;
		break;

	case OHMD_POSITION_VECTOR:
		float thispos[3];
		thispos[0] = fmax(fmin(priv->sensor_fusion.world_pos.x/700.0,0.5),-0.5);
		thispos[1] = fmax(fmin(priv->sensor_fusion.world_pos.y/700.0,0.5),-0.5);
		thispos[2] = fmax(fmin(priv->sensor_fusion.world_pos.z/700.0,0.5),-0.5);
	    pos_sim_run(&(thispos[0]),out);

		/*out[0] = fmax(fmin(priv->sensor_fusion.world_pos.x/150.0,1),-1);
		out[1] = fmax(fmin(priv->sensor_fusion.world_pos.y/150.0,1),-1);
		out[2] = fmax(fmin(priv->sensor_fusion.world_pos.z/150.0,1),-1);*/
	
		break;

	case OHMD_DISTORTION_K:
		// TODO this should be set to the equivalent of no distortion
		memset(out, 0, sizeof(float) * 6);
		break;

	case OHMD_CONTROLS_STATE:
		out[0] = (priv->buttons & PSVR_BUTTON_VOLUME_PLUS) != 0;
		out[1] = (priv->buttons & PSVR_BUTTON_VOLUME_MINUS) != 0;
		out[2] = (priv->buttons & PSVR_BUTTON_MIC_MUTE) != 0;
		
		break;

	default:
		ohmd_set_error(priv->base.ctx, "invalid type given to getf (%ud)", type);
		return -1;
		break;
	}

	return 0;
}

static void close_device(ohmd_device* device)
{
	psvr_priv* priv = (psvr_priv*)device;

	// set cinematic mode for the hmd
	hid_write(priv->hmd_control, psvr_cinematicmode_on, sizeof(psvr_cinematicmode_on));

	LOGD("Closing Sony PSVR device.");

	teardown(priv);

	
}

static hid_device* open_device_idx(int manufacturer, int product, int iface, int device_index)
{
	struct hid_device_info* devs = hid_enumerate(manufacturer, product);
	struct hid_device_info* cur_dev = devs;

	int idx = 0;
	hid_device* ret = NULL;

	while (cur_dev) {
		LOGI("%04x:%04x %s", manufacturer, product, cur_dev->path);

		if (cur_dev->interface_number == iface) {
			if(idx == device_index){
				LOGI("\topening '%s'", cur_dev->path);
				ret = hid_open_path(cur_dev->path);
				break;
			}

			idx++;
		}

		cur_dev = cur_dev->next;
	}

	hid_free_enumeration(devs);

	return ret;
}

static ohmd_device* open_device(ohmd_driver* driver, ohmd_device_desc* desc)
{
	psvr_priv* priv = ohmd_alloc(driver->ctx, sizeof(psvr_priv));

	if(!priv)
		return NULL;

	priv->base.ctx = driver->ctx;

	int idx = atoi(desc->path);

	// Open the HMD device
	priv->hmd_handle = open_device_idx(SONY_ID, PSVR_HMD, 4, idx);

	if(!priv->hmd_handle)
		goto cleanup;

	if(hid_set_nonblocking(priv->hmd_handle, 1) == -1){
		ohmd_set_error(driver->ctx, "failed to set non-blocking on device");
		goto cleanup;
	}

	// Open the HMD Control device
	priv->hmd_control = open_device_idx(SONY_ID, PSVR_HMD, 5, idx);

	if(!priv->hmd_control)
		goto cleanup;

	if(hid_set_nonblocking(priv->hmd_control, 1) == -1){
		ohmd_set_error(driver->ctx, "failed to set non-blocking on device");
		goto cleanup;
	}

	// turn the display on
	if (hid_write(priv->hmd_control, psvr_power_on, sizeof(psvr_power_on)) == -1) {
		ohmd_set_error(driver->ctx, "failed to write to device (power on)");
		goto cleanup;
	}

	// set VR mode for the hmd
	if (hid_write(priv->hmd_control, psvr_vrmode_on, sizeof(psvr_vrmode_on)) == -1) {
		ohmd_set_error(driver->ctx, "failed to write to device (set VR mode)");
		goto cleanup;
	}
	pos_sim_init(1);
	// Set default device properties
	ohmd_set_default_device_properties(&priv->base.properties);
	priv->base.properties.universal_distortion_k[0]= 0.200000;
    priv->base.properties.universal_distortion_k[1]= 0.090000;
    priv->base.properties.universal_distortion_k[2]=-0.060000;
    priv->base.properties.universal_distortion_k[3]= 0.770000;
	/*priv->base.properties.universal_distortion_k[0]= 0.75;
    priv->base.properties.universal_distortion_k[1]= -0.01f;
    priv->base.properties.universal_distortion_k[2]= 0.75f;
    priv->base.properties.universal_distortion_k[3]= 0.0f;
	priv->base.properties.universal_distortion_k[4]= 3.8f;*/
	/*priv->base.properties.universal_aberration_k[0] = 0.999f;
	priv->base.properties.universal_aberration_k[1] = 1.008f;
	priv->base.properties.universal_aberration_k[2] = 1.018f;*/
	// Set device properties TODO: Get from device
	priv->base.properties.hsize = 0.13f;//0.126; //from calculated specs
	priv->base.properties.vsize = 0.07f;//0.071; //from calculated specs
	priv->base.properties.hres = 1920;
	priv->base.properties.vres = 1080;

	// Measurements taken from
	// https://github.com/gusmanb/PSVRFramework/wiki/Optical-characteristics
	priv->base.properties.lens_sep =  0.13f / 2.0f;//0.0630999878f;
	priv->base.properties.lens_vpos =0.07f / 2.0f;// 0.0394899882f;

	//priv->base.properties.fov = DEG_TO_RAD(110.57f); //DEG_TO_RAD(103.57f); //TODO: Confirm exact mesurements
	priv->base.properties.fov = DEG_TO_RAD(92.00f); //DEG_TO_RAD(103.57f); //TODO: Confirm exact mesurements 96
	//priv->base.properties.ratio = (1920.0f / 1080.0f) / 2.0f;
	priv->base.properties.ratio = ((1920.0f/ 2.0f) / 1080.0f) ;
	priv->base.properties.control_count = 3;
	priv->base.properties.controls_hints[0] = OHMD_VOLUME_PLUS;
	priv->base.properties.controls_hints[1] = OHMD_VOLUME_MINUS;
	priv->base.properties.controls_hints[2] = OHMD_MIC_MUTE;
	priv->base.properties.controls_types[0] = OHMD_DIGITAL;
	priv->base.properties.controls_types[1] = OHMD_DIGITAL;
	priv->base.properties.controls_types[2] = OHMD_DIGITAL;

	// calculate projection eye projection matrices from the device properties
	ohmd_calc_default_proj_matrices(&priv->base.properties);

	// set up device callbacks
	priv->base.update = update_device;
	priv->base.close = close_device;
	priv->base.getf = getf;

	ofusion_init(&priv->sensor_fusion);

	return (ohmd_device*)priv;

cleanup:
	if (priv) {
		//teardown(priv);
		//free(priv);

	}

	return NULL;
}

static void get_device_list(ohmd_driver* driver, ohmd_device_list* list)
{
	struct hid_device_info* devs = hid_enumerate(SONY_ID, PSVR_HMD);
	struct hid_device_info* cur_dev = devs;

	int idx = 0;
	while (cur_dev) {
		ohmd_device_desc* desc;

		// Warn if hidapi does not provide interface numbers
		if (cur_dev->interface_number == -1) {
			LOGE("hidapi does not provide PSVR interface numbers\n");
#ifdef __APPLE__
			LOGE("see https://github.com/signal11/hidapi/pull/380\n");
#endif
			break;
		}

		// Register one device for each IMU sensor interface
		if (cur_dev->interface_number == 4) {
			desc = &list->devices[list->num_devices++];

			strcpy(desc->driver, "OpenHMD Sony PSVR Driver");
			strcpy(desc->vendor, "SNY");
			strcpy(desc->product, "PSVR");

			desc->revision = 0;

			snprintf(desc->path, OHMD_STR_SIZE, "%d", idx);

			desc->driver_ptr = driver;

			desc->device_class = OHMD_DEVICE_CLASS_HMD;
			desc->device_flags = OHMD_DEVICE_FLAGS_ROTATIONAL_TRACKING;

			idx++;
		}

		cur_dev = cur_dev->next;
	}

	hid_free_enumeration(devs);
}
static ohmd_driver* localDRV=NULL;
static void destroy_driver(ohmd_driver* drv)
{
	if(localDRV==NULL)
		return;
	if(localDRV!=drv)
		free(localDRV);//return;	
	LOGD("shutting down Sony PSVR driver");

	free(drv);
	localDRV=NULL;
}

ohmd_driver* ohmd_create_psvr_drv(ohmd_context* ctx)
{
	ohmd_driver* drv = ohmd_alloc(ctx, sizeof(ohmd_driver));

	if(!drv)
		return NULL;

	drv->get_device_list = get_device_list;
	drv->open_device = open_device;
	
	drv->destroy = destroy_driver;
	drv->ctx = ctx;
	localDRV=drv;
	return drv;
}
