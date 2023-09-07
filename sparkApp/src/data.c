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
	short* channel_1;
	short* channel_2;
	short* channel_3;
	short* channel_4;
	short* channel_5;
	short* channel_6;
	short* channel_7;
	short* channel_8;

	data_array  = (short*) record->a;
	channel_1 = record->vala;
	channel_2 = record->valb;
	channel_3 = record->valc;
	channel_4 = record->vald;
	channel_5 = record->vale;
	channel_6 = record->valf;
	channel_7 = record->valg;
	channel_8 = record->valh;
	for(i = 0; i < record->nea; i += 4) {
		channel_1[i / 8] = data_array[i];
		channel_2[i / 8] = data_array[i + 1];
		channel_3[i / 8] = data_array[i + 2];
		channel_4[i / 8] = data_array[i + 3];
		channel_5[i / 8] = data_array[i + 4];
		channel_6[i / 8] = data_array[i + 5];
		channel_7[i / 8] = data_array[i + 6];
		channel_8[i / 8] = data_array[i + 7];
	}

	return 0;
}

epicsRegisterFunction(split_2_way);
epicsRegisterFunction(split_4_way);
epicsRegisterFunction(split_8_way);

