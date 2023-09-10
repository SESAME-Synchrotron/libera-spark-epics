#!bin/linux-x86_64/spark

< iocBoot/iocspark/envPaths

epicsEnvSet("STREAM_PROTOCOL_PATH", "protocol")

dbLoadDatabase "dbd/spark.dbd"
spark_registerRecordDeviceDriver pdbbase

dbLoadRecords("$(ASYN)/db/asynRecord.db", "PORT=$(PORT),P=$(PREFIX):,R=PORT,ADDR=,IMAX=,OMAX=")
dbLoadRecords("db/parameters.db", "PORT=$(PORT),PREFIX=$(PREFIX)")
dbLoadRecords("db/adc.db",        "PORT=$(PORT),PREFIX=$(PREFIX),BUFFER=$(ADC_BUFFER=1024),SIZE=$(ADC_SIZE=256)")
dbLoadRecords("db/tbt_iq.db",     "PORT=$(PORT),PREFIX=$(PREFIX),BUFFER=$(TBT_IQ_BUFFER=2048),SIZE=$(TBT_IQ_SIZE=256)")

drvAsynIPPortConfigure("$(PORT)", "$(HOST)", 0, 0, 1)


iocInit

