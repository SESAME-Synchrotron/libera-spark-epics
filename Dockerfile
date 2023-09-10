FROM registry.docker.com/epics-el8 as builder

RUN  yum install -y stream-device; yum clean all;

COPY .  /spark
WORKDIR /spark
RUN  make

FROM registry.docker.com/alpine

# Directory tree.
RUN  mkdir spark
WORKDIR /spark
COPY --from=builder /spark/db/       /spark/db
COPY --from=builder /spark/dbd/      /spark/dbd
COPY --from=builder /spark/bin/      /spark/bin
COPY --from=builder /spark/iocBoot/  /spark/iocBoot
COPY --from=builder /spark/protocol/ /spark/protocol
COPY --from=builder /spark/run.cmd   /spark
COPY --from=builder /opt/epics/support/asyn/db/asynRecord.db /opt/epics/support/asyn/db/

# EPICS Base core libraries.
COPY --from=builder /opt/epics/base/lib/linux-x86_64/libdbRecStd.so.3.15 /opt/epics/base/lib/linux-x86_64/
COPY --from=builder /opt/epics/base/lib/linux-x86_64/libdbCore.so.3.15   /opt/epics/base/lib/linux-x86_64/
COPY --from=builder /opt/epics/base/lib/linux-x86_64/libca.so.3.15       /opt/epics/base/lib/linux-x86_64/
COPY --from=builder /opt/epics/base/lib/linux-x86_64/libCom.so.3.15      /opt/epics/base/lib/linux-x86_64/

# EPICS support modules.
COPY --from=builder /lib64/libsscan.so.2.11          /lib64/
COPY --from=builder /usr/lib64/libcalc.so.3.7        /usr/lib64/
COPY --from=builder /usr/lib64/libdevIocStats.so.3.1 /usr/lib64/
COPY --from=builder /usr/lib64/libasyn.so.4.42       /usr/lib64/
COPY --from=builder /usr/lib64/libstream.so.2.8      /usr/lib64/
COPY --from=builder /usr/lib64/libpcre.so.1          /usr/lib64/
COPY --from=builder /usr/lib64/libpcre2-8.so.0       /usr/lib64/

# OS.
COPY --from=builder /lib64/libstdc++.so.6          /lib64/
COPY --from=builder /lib64/libm.so.6               /lib64/
COPY --from=builder /lib64/libgcc_s.so.1           /lib64/
COPY --from=builder /lib64/libc.so.6               /lib64/
COPY --from=builder /lib64/libpthread.so.0         /lib64/
COPY --from=builder /lib64/libreadline.so.7        /lib64/
COPY --from=builder /lib64/librt.so.1              /lib64/
COPY --from=builder /lib64/libdl.so.2              /lib64/
COPY --from=builder /lib64/libtinfo.so.6           /lib64/
COPY --from=builder /lib64/ld-linux-x86-64.so.2    /lib64/
COPY --from=builder /usr/lib64/libxml2.so.2        /usr/lib64/
COPY --from=builder /usr/lib64/libtirpc.so.3       /usr/lib64/
COPY --from=builder /usr/lib64/libz.so.1           /usr/lib64/
COPY --from=builder /usr/lib64/liblzma.so.5        /usr/lib64/
COPY --from=builder /usr/lib64/libgssapi_krb5.so.2 /usr/lib64/
COPY --from=builder /usr/lib64/libkrb5.so.3        /usr/lib64/
COPY --from=builder /usr/lib64/libk5crypto.so.3    /usr/lib64/
COPY --from=builder /usr/lib64/libcom_err.so.2     /usr/lib64/
COPY --from=builder /usr/lib64/libkrb5support.so.0 /usr/lib64/
COPY --from=builder /usr/lib64/libcrypto.so.1.1    /usr/lib64/
COPY --from=builder /usr/lib64/libkeyutils.so.1    /usr/lib64/
COPY --from=builder /usr/lib64/libresolv.so.2      /usr/lib64/
COPY --from=builder /usr/lib64/libselinux.so.1     /usr/lib64/
COPY --from=builder /usr/lib64/libpcre2-8.so.0     /usr/lib64/
COPY --from=builder /usr/lib64/libnss_dns.so.2     /usr/lib64/

# CMD ["./bin/linux-x86_64/ioc", "iocBoot/ioc/st.cmd"]
CMD ["./run.cmd"]

