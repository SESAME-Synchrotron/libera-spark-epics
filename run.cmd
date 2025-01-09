#!bin/linux-x86_64/spark

< iocBoot/iocspark/envPaths
epicsEnvSet("PORT",   "LBS")
epicsEnvSet("HOST",   "10.2.4.64:23")
epicsEnvSet("PREFIX", "SR-DI-$(PORT)")
epicsEnvSet("STREAM_PROTOCOL_PATH", "protocol")
epicsEnvSet("ADC_BUFFER", "400000")
epicsEnvSet("TBT_BUFFER", "400000")
epicsEnvSet("MAX_ADC_SIZE", "100000")
epicsEnvSet("MAX_TBT_SIZE", "100000")
epicsEnvSet("ADC_SIZE", "10000")
epicsEnvSet("TBT_SIZE", "10000")

dbLoadDatabase "dbd/spark.dbd"
spark_registerRecordDeviceDriver pdbbase

dbLoadRecords("$(ASYN)/db/asynRecord.db", "PORT=$(PORT),P=$(PREFIX):,R=PORT,ADDR=,IMAX=,OMAX=")
dbLoadRecords("db/parameters.db", "PORT=$(PORT),PREFIX=$(PREFIX)")
dbLoadRecords("db/adc.db",            "PORT=$(PORT),PREFIX=$(PREFIX),BUFFER=$(ADC_BUFFER),SIZE=$(ADC_SIZE),MAX_SIZE=$(MAX_ADC_SIZE)")
dbLoadRecords("db/tbt-iq.db",         "PORT=$(PORT),PREFIX=$(PREFIX),BUFFER=$(TBT_BUFFER),SIZE=$(TBT_SIZE),MAX_SIZE=$(MAX_TBT_SIZE)")
dbLoadRecords("db/tbt-amplitudes.db", "PORT=$(PORT),PREFIX=$(PREFIX),BUFFER=$(TBT_BUFFER),SIZE=$(TBT_SIZE),MAX_SIZE=$(MAX_TBT_SIZE)")
dbLoadRecords("db/tbt-qsum.db",       "PORT=$(PORT),PREFIX=$(PREFIX),BUFFER=$(TBT_BUFFER),SIZE=$(TBT_SIZE),MAX_SIZE=$(MAX_TBT_SIZE)")
dbLoadRecords("db/tbt-xy.db",         "PORT=$(PORT),PREFIX=$(PREFIX),BUFFER=$(TBT_BUFFER),SIZE=$(TBT_SIZE),MAX_SIZE=$(MAX_TBT_SIZE)")

dbLoadRecords("db/tbt-iq-decimated.db",         "PORT=$(PORT),PREFIX=$(PREFIX),BUFFER=$(TBT_BUFFER),SIZE=$(TBT_SIZE),MAX_SIZE=$(MAX_TBT_SIZE)")
dbLoadRecords("db/tbt-amplitudes-decimated.db", "PORT=$(PORT),PREFIX=$(PREFIX),BUFFER=$(TBT_BUFFER),SIZE=$(TBT_SIZE),MAX_SIZE=$(MAX_TBT_SIZE)")
dbLoadRecords("db/tbt-qsum-decimated.db",       "PORT=$(PORT),PREFIX=$(PREFIX),BUFFER=$(TBT_BUFFER),SIZE=$(TBT_SIZE),MAX_SIZE=$(MAX_TBT_SIZE)")
dbLoadRecords("db/tbt-xy-decimated.db",         "PORT=$(PORT),PREFIX=$(PREFIX),BUFFER=$(TBT_BUFFER),SIZE=$(TBT_SIZE),MAX_SIZE=$(MAX_TBT_SIZE)")

dbLoadRecords("db/tdp-amplitudes.db",           "PORT=$(PORT),PREFIX=$(PREFIX),BUFFER=$(TBT_BUFFER),SIZE=$(TBT_SIZE),MAX_SIZE=$(MAX_TBT_SIZE)")
dbLoadRecords("db/tdp-amplitudes-decimated.db", "PORT=$(PORT),PREFIX=$(PREFIX),BUFFER=$(TBT_BUFFER),SIZE=$(TBT_SIZE),MAX_SIZE=$(MAX_TBT_SIZE)")
dbLoadRecords("db/tdp-qsum.db",                 "PORT=$(PORT),PREFIX=$(PREFIX),BUFFER=$(TBT_BUFFER),SIZE=$(TBT_SIZE),MAX_SIZE=$(MAX_TBT_SIZE)")
dbLoadRecords("db/tdp-qsum-decimated.db",       "PORT=$(PORT),PREFIX=$(PREFIX),BUFFER=$(TBT_BUFFER),SIZE=$(TBT_SIZE),MAX_SIZE=$(MAX_TBT_SIZE)")
dbLoadRecords("db/tdp-xy.db",                   "PORT=$(PORT),PREFIX=$(PREFIX),BUFFER=$(TBT_BUFFER),SIZE=$(TBT_SIZE),MAX_SIZE=$(MAX_TBT_SIZE)")
dbLoadRecords("db/tdp-xy-decimated.db",         "PORT=$(PORT),PREFIX=$(PREFIX),BUFFER=$(TBT_BUFFER),SIZE=$(TBT_SIZE),MAX_SIZE=$(MAX_TBT_SIZE)")

drvAsynIPPortConfigure("$(PORT)", "$(HOST)", 0, 0, 1)

iocInit

