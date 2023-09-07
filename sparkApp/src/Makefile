TOP=../..

include $(TOP)/configure/CONFIG
#----------------------------------------
#  ADD MACRO DEFINITIONS AFTER THIS LINE
#=============================

#=============================
# Build the IOC application

PROD_IOC = spark
# spark.dbd will be created and installed
DBD += spark.dbd

# spark.dbd will be made up from these files:
spark_DBD += base.dbd
spark_DBD += sCalcoutRecord.dbd
spark_DBD += stream.dbd
spark_DBD += asyn.dbd
spark_DBD += drvAsynIPPort.dbd
spark_DBD += data.dbd

# Add all the support libraries needed by this IOC
spark_LIBS += calc
spark_LIBS += stream
spark_LIBS += asyn 

# spark_registerRecordDeviceDriver.cpp derives from spark.dbd
spark_SRCS += spark_registerRecordDeviceDriver.cpp
spark_SRCS += data.c

# Build the main IOC entry point on workstation OSs.
spark_SRCS_DEFAULT += sparkMain.cpp
spark_SRCS_vxWorks += -nil-

# Add support from base/src/vxWorks if needed
#spark_OBJS_vxWorks += $(EPICS_BASE_BIN)/vxComLibrary

# Finally link to the EPICS Base libraries
spark_LIBS += $(EPICS_BASE_IOC_LIBS)

#===========================

include $(TOP)/configure/RULES
#----------------------------------------
#  ADD RULES AFTER THIS LINE

