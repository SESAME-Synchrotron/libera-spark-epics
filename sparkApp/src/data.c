#include <aSubRecord.h>
#include <registryFunction.h>
#include <epicsExport.h>

static long split_2_way(aSubRecord* record)
{
	long i;
	short* data_array;
	short* channel_a;
	short* channel_b;

	data_array = (short*) record->a;
	channel_a =  (short*) record->vala;
	channel_b =  (short*) record->valb;
	for(i = 0; i < record->nea; i += 2) {
		channel_a[i / 2] = data_array[i];
		channel_b[i / 2] = data_array[i + 1];
	}

	return 0;
}

static long split_4_way(aSubRecord* record)
{
	long i;
	short* data_array;
	short* channel_a;
	short* channel_b;
	short* channel_c;
	short* channel_d;

	data_array = (short*) record->a;
	channel_a =  (short*) record->vala;
	channel_b =  (short*) record->valb;
	channel_c =  (short*) record->valc;
	channel_d =  (short*) record->vald;
	for(i = 0; i < record->nea; i += 4) {
		channel_a[i / 4] = data_array[i];
		channel_b[i / 4] = data_array[i + 1];
		channel_c[i / 4] = data_array[i + 2];
		channel_d[i / 4] = data_array[i + 3];
	}

	return 0;
}

static long split_8_way(aSubRecord* record)
{
	long i;
	short* data_array;
	short* channel_ptr;

	data_array  = (short*) record->a;
	channel_ptr = record->vala;
	for(i = 0; i < record->nea; i++) {
		((short*)(channel_ptr + i % 8))[i / 8] = data_array[i];
	}

	return 0;
}

epicsRegisterFunction(split_2_way);
epicsRegisterFunction(split_4_way);
epicsRegisterFunction(split_8_way);

