// Copyright 2013, Fredrik Hultin.
// Copyright 2013, Jakob Bornecrantz.
// SPDX-License-Identifier: BSL-1.0
/*
 * OpenHMD - Free and Open Source API and drivers for immersive technology.
 */

/* Sensor Fusion Implementation */


#include <string.h>
#include "openhmdi.h"
#include <time.h>
void ofusion_init(fusion* me)
{
	memset(me, 0, sizeof(fusion));
	me->orient.w = 1.0f;

	ofq_init(&me->mag_fq, 20);
	ofq_init(&me->accel_fq, 20);
	ofq_init(&me->accel_wq, 3);
	ofq_init(&me->accel_we, 100);
	ofq_init(&me->ang_vel_fq, 20);

	me->flags = FF_USE_GRAVITY;
	me->grav_gain = 0.05f;
}

void get_world_ref_accel(fusion* me,vec3f* world_accel,const vec3f* accel,float dt){
	vec3f world_ref_accel,world_ref_accel2;
	vec3f accel_mean;
	ofq_get_mean(&me->accel_fq, &accel_mean);
	
	
	vec3f thisAccel = {{-accel->x,accel->y , -accel->z}};
	//ovec3f_normalize_me(&world_accel);
	//ovec3f_subtract(&accel_mean,&world_accel,&world_ref_accel);
	oquatf_get_rotated(&me->orient, accel, &world_ref_accel2);
	ovec3f_subtract(&world_ref_accel2,&accel_mean,&world_ref_accel);
	//printf("%f\n",(now-grav));
	//printf("%f\t%f\t%f\n",world_ref_accel2.x, world_ref_accel2.y, world_ref_accel2.z);
	//printf("%f\t%f\t%f\n",world_ref_accel.x, world_ref_accel.y, world_ref_accel.z);
	//printf("%f\t%f\t%f - \t%f - \t%f\t%f\t%f\n",world_ref_accel.x, world_ref_accel.y, world_ref_accel.z,0.0,accel->x,accel->y, accel->z);
	
	//ofq_add(&me->accel_wq, &world_ref_accel);

}

void testing_world_ref_accel(fusion* me,vec3f* world_accel,const vec3f* accel,float dt){
	vec3f down = {0.0, 10.0, 0.0};
	vec3f world_accel_error= {0.0, 0.0, 0.0};
	ovec3f_subtract(world_accel,&down,&world_accel_error);
	//printf("%f %f %f \n",world_accel->x,world_accel->y,world_accel->z);
	//printf("%f %f %f \n",world_accel_error.x,world_accel_error.y,world_accel_error.z);
	//world_accel_error now has the difference between expected world_accel and that coming from the accelerometers
	//get an average from this and subtract it from world accel
	
	ofq_add(&me->accel_we, &world_accel_error);
	//get the "real" error
	ofq_get_mean(&me->accel_we, &world_accel_error);
	vec3f world_accel_actual= {0.0, 10.0, 0.0};
	ovec3f_subtract(world_accel,&world_accel_error,&world_accel_actual);
	ovec3f_subtract(&world_accel_actual,&down,&world_accel_actual);
	//printf("%f %f %f \n",world_accel->x,world_accel->y,world_accel->z);
	//printf("%f %f %f \n",world_accel_actual.x,world_accel_actual.y,world_accel_actual.z);
	double threshold=0.15;
	//printf("%f \n",dt);
	/*if(world_accel_actual.x<-1*threshold)
		printf("-x\n");
	if(world_accel_actual.x>threshold)
		printf("x\n");	
	if(world_accel_actual.y<-2*threshold)
		printf("-y\n");
	if(world_accel_actual.y>2*threshold)
		printf("y\n");
	if(world_accel_actual.z<-1*threshold)
		printf("-z\n");
	if(world_accel_actual.z>threshold)
		printf("z\n");*/
	float accel_length = ovec3f_get_length(&world_accel_actual);
	if(accel_length>threshold)			
		ofq_add(&me->accel_wq, &world_accel_actual);
	else{
		vec3f zero = {0.0, 0.0, 0.0};
		ofq_add(&me->accel_wq, &zero);
	}
		
	//world_accel_actual now has an instanious accelleration we can use to estimate movement

}
/*void get_world_ref_accel_old(fusion* me,vec3f* world_accel,const vec3f* accel){
	vec3f world_ref_accel,world_ref_accel2;
	vec3f accel_mean;
	ofq_get_mean(&me->accel_fq, &accel_mean);
	float grav = fabsf(ovec3f_get_length(&accel_mean));
	ovec3f_normalize_me(&accel_mean);
	float now = fabsf(ovec3f_get_length(world_accel));
	vec3f down = {{accel_mean.x*grav, accel_mean.y*grav, accel_mean.z*grav}};
	oquatf_normalize_me(&me->orient);
	oquatf_get_rotated(&me->orient, &down, &world_ref_accel2);
	vec3f thisAccel = {{accel->x,accel->y , accel->z}};
	//ovec3f_normalize_me(&world_accel);
	//ovec3f_subtract(&accel_mean,&world_accel,&world_ref_accel);
	ovec3f_subtract(&thisAccel,&world_ref_accel2,&world_ref_accel);
	//printf("%f\t%f\t%f\n",world_ref_accel2.x, world_ref_accel2.y, world_ref_accel2.z);
	//printf("%f\t%f\t%f\n",world_ref_accel.x, world_ref_accel.y, world_ref_accel.z);
	printf("%f\t%f\t%f\t%f\t%f\t%f\t%f\n",world_ref_accel.x, world_ref_accel.y, world_ref_accel.z, (now-grav),accel->x,accel->y, accel->z);
	ofq_add(&me->accel_wq, &world_ref_accel);
}*/

void ofusion_update(fusion* me, float dt, const vec3f* ang_vel, const vec3f* accel, const vec3f* mag)
{
	me->ang_vel = *ang_vel;
	me->accel = *accel;
	me->raw_mag = *mag;

	me->mag = *mag;

	vec3f world_accel;
	
	oquatf_get_rotated(&me->orient, accel, &world_accel);

	me->iterations += 1;
	me->time += dt;
	
	//ovec3f_subtract(&world_accel,&down,&world_ref_accel2);
	
	ofq_add(&me->mag_fq, mag);
	//if(abs(ovec3f_get_length(&world_accel)- 10.0f<.4f))
	ofq_add(&me->accel_fq, &world_accel);
	
	//else
	//	ofq_add(&me->accel_fq, &world_ref_accel2);
	//get_world_ref_accel(me,&world_accel,accel,dt);
	testing_world_ref_accel(me,&world_accel,accel,dt);
	ofq_add(&me->ang_vel_fq, ang_vel);

	float ang_vel_length = ovec3f_get_length(ang_vel);

	if(ang_vel_length > 0.0001f){
		vec3f rot_axis =
			{{ ang_vel->x / ang_vel_length, ang_vel->y / ang_vel_length, ang_vel->z / ang_vel_length }};

		float rot_angle = ang_vel_length * dt;
		
		quatf delta_orient;
		oquatf_init_axis(&delta_orient, &rot_axis, rot_angle);

		oquatf_mult_me(&me->orient, &delta_orient);
		
	}

	// gravity correction
	if(me->flags & FF_USE_GRAVITY){
		const float gravity_tolerance = .2f, ang_vel_tolerance = .1f;
		const float min_tilt_error = 0.05f, max_tilt_error = 0.01f;

		// if the device is within tolerance levels, count this as the device is level and add to the counter
		// otherwise reset the counter and start over

		me->device_level_count =
			fabsf(ovec3f_get_length(accel) - 10.0f) < gravity_tolerance * 2.0f && ang_vel_length < ang_vel_tolerance
			? me->device_level_count + 1 : 0;
		me->accel_level_count =
			fabsf(ovec3f_get_length(accel) - 10.0f) > gravity_tolerance/2.0f	? me->accel_level_count + 1 : 0;
		// device has been level for long enough, grab mean from the accelerometer filter queue (last n values)
		// and use for correction
		
		
		vec3f accel_mean;
		ofq_get_mean(&me->accel_wq, &accel_mean);
		double t_accel=ovec3f_get_length(&accel_mean);
		if (fabsf(t_accel)>0.00005 ){
			me->accel_level_count =1;
			//vec3f inc={{(accel_mean.x*30),(accel_mean.y*10),(accel_mean.z*30)}};
			vec3f inc={{(accel_mean.x*-2),(accel_mean.y*2),(accel_mean.z*-2)}};
			vec3f z={{(0),(0),(0)}};
			ovec3f_add(&z,&inc,&me->world_accel);
		}else{
			me->world_accel.x=0;
			me->world_accel.y=0;
			me->world_accel.z=0;
			/*me->world_vel.x=0;
			me->world_vel.y=0;
			me->world_vel.z=0;*/
			me->world_vel.x-=me->world_vel.x/1000;
			me->world_vel.y-=me->world_vel.y/1000;
			me->world_vel.z-=me->world_vel.z/1000;
		}
		//printf("%f %f %f\n",me->world_pos.x,me->world_pos.y,me->world_pos.z);
		//printf("%f %f %f\n",me->world_accel.x,me->world_accel.y,me->world_accel.z);
		//increment
		me->world_vel.x+=me->world_accel.x*dt;
		me->world_vel.y+=me->world_accel.y*dt;
		me->world_vel.z+=me->world_accel.z*dt;
		t_accel=ovec3f_get_length(&me->world_vel);
		//printf("%f\n",t_accel);
		if(t_accel<0.1){
			me->world_pos.x-=(me->world_pos.x)/2000;
			me->world_pos.y-=(me->world_pos.y)/2000;
			me->world_pos.z-=(me->world_pos.z)/2000;
		}
		
		//move by velocity
		me->world_pos.x+=me->world_vel.x;
		me->world_pos.x+=me->world_vel.y;
		me->world_pos.z+=me->world_vel.z;

		//reduce velocity
		/*me->world_vel.x-=me->world_vel.x/5000;
		me->world_vel.y-=me->world_vel.y/5000;
		me->world_vel.z-=me->world_vel.z/5000;*/

		me->world_pos.x = fmax(fmin(me->world_pos.x,350),-350);
		me->world_pos.y = fmax(fmin(me->world_pos.y,350),-350);
		me->world_pos.z = fmax(fmin(me->world_pos.z,350),-350);
		if(me->device_level_count > 50 && t_accel<0.1){
			me->device_level_count = 0;
			//vec3f accel_mean;
			ofq_get_mean(&me->accel_fq, &accel_mean);
			if (ovec3f_get_length(&accel_mean) - 10.0f < gravity_tolerance)
			{
				// Calculate a cross product between what the device
				// thinks is up and what gravity indicates is down.
				// The values are optimized of what we would get out
				// from the cross product.
				vec3f tilt = {{accel_mean.z, 0, -accel_mean.x}};

				ovec3f_normalize_me(&tilt);
				ovec3f_normalize_me(&accel_mean);
				vec3f up = {{0, 1.0f, 0}};
				
				float tilt_angle = ovec3f_get_angle(&up, &accel_mean);

				if(tilt_angle > max_tilt_error){
					//printf("pause 6dof for the recalibration\n");
					me->accel_level_count=-50;//pause 6dof for the recalibration
					me->grav_error_angle = tilt_angle;
					me->grav_error_axis = tilt;
				}
			}
		}

		// perform gravity tilt correction
		if(me->grav_error_angle > min_tilt_error){
			float use_angle;
			// if less than 2000 iterations have passed, set the up axis to the correction value outright
			if(me->iterations < 2000){
				use_angle = -me->grav_error_angle;
				me->grav_error_angle = 0;
			}

			// otherwise try to correct
			else {
				use_angle = -me->grav_gain * me->grav_error_angle * 0.005f * (5.0f * ang_vel_length + 1.0f);
				me->grav_error_angle += use_angle;
			}

			// perform the correction
			quatf corr_quat, old_orient;
			oquatf_init_axis(&corr_quat, &me->grav_error_axis, use_angle);
			old_orient = me->orient;

			oquatf_mult(&corr_quat, &old_orient, &me->orient);
		}
	}

	// mitigate drift due to floating point
	// inprecision with quat multiplication.
	
	
	oquatf_normalize_me(&me->orient);
	/*vec3f out;
	vec3f rot={0,0,1};
	oquatf_get_rotated(&me->orient, &rot, &out);
	double angle=atan(out.z/out.x)*57.2958;
	printf("%f %f %f %f\n",angle,out.x,out.y,out.z);*/
			
}
