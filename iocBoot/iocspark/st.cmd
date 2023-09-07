#!bin/linux-x86_64/spark

< iocBoot/iocspark/envPaths

# Define asyn port name, prefix name and host information.

epicsEnvSet("STREAM_PROTOCOL_PATH", "protocol")

dbLoadDatabase "dbd/spark.dbd"
spark_registerRecordDeviceDriver pdbbase

dbLoadRecords("$(ASYN)/db/asynRecord.db", "PORT=$(PORT),P=$(PREFIX):,R=PORT,ADDR=,IMAX=,OMAX=")
dbLoadRecords("db/parameters.db", "PORT=$(PORT),PREFIX=$(PREFIX)")
drvAsynIPPortConfigure("$(PORT)", "$(HOST)", 0, 0, 1)

iocInit

