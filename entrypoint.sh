#!/bin/sh
MASTER_CFG=/usr/local/etc/mfs/mfschunkserver.cfg

chown mfs:mfs -R /mnt/hdd
MYIP=$(ifconfig | sed -En 's/127.0.0.1//;s/.*inet (addr:)?(([0-9]*\.){3}[0-9]*).*/\2/p')
echo "Set master host as $MFSM_MASTERHOST"
sed -i "s/# MASTER_HOST = mfsmaster/MASTER_HOST = $MFSM_MASTERHOST/g" $MASTER_CFG
echo "Set chunkserver label to $MFSC_LABEL"
sed -i "s/# LABEL = _/LABEL = $MFSC_LABEL/g" $MASTER_CFG
echo "Set leave space to $MFSC_LEAVE_SPACE"
sed -i "s/# HDD_LEAVE_SPACE_DEFAULT = 4GiB/HDD_LEAVE_SPACE_DEFAULT = $MFSC_LEAVE_SPACE/g" $MASTER_CFG
echo "My local IP Address is $MYIP"
sed -i "s/# CSSERV_LISTEN_HOST = \*/CSSERV_LISTEN_HOST = $MYIP/g" $MASTER_CFG
sed -i "s/# BIND_HOST = \*/BIND_HOST = $MYIP/g" $MASTER_CFG

mfschunkserver -d
