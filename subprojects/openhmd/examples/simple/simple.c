/*
 * OpenHMD - Free and Open Source API and drivers for immersive technology.
 * Copyright (C) 2013 Fredrik Hultin.
 * Copyright (C) 2013 Jakob Bornecrantz.
 * Distributed under the Boost 1.0 licence, see LICENSE for full text.
 */

/* Simple Test */

#include <openhmd.h>
#include <assert.h>
#include <stdio.h>
#include <stdlib.h>

void ohmd_sleep(double);

// gets float values from the device and prints them
void print_infof(ohmd_device* hmd, const char* name, int len, ohmd_float_value val)
{
	float f[16];
	assert(len <= 16);
	ohmd_device_getf(hmd, val, f);
	printf("%-25s", name);
	for(int i = 0; i < len; i++)
		printf("%f ", f[i]);
	printf("\n");
}

// gets int values from the device and prints them
void print_infoi(ohmd_device* hmd, const char* name, int len, ohmd_int_value val)
{
	int iv[16];
	assert(len <= 16);
	ohmd_device_geti(hmd, val, iv);
	printf("%-25s", name);
	for(int i = 0; i < len; i++)
		printf("%d ", iv[i]);
	printf("\n");
}

int main(int argc, char** argv)
{
	
	
	return 0;
}
