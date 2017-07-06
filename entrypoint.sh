#!/bin/sh
MASTER_CFG=/usr/local/etc/mfs/mfschunkserver.cfg

chown mfs:mfs -R /mnt/hdd
echo "Set master host as $MFSM_MASTERHOST"
sed -i "s/# MASTER_HOST = mfsmaster/MASTER_HOST = $MFSM_MASTERHOST/g" $MASTER_CFG
echo "Set chunkserver label to $MFSC_LABEL"
sed -i "s/# LABEL = _/LABEL = $MFSC_LABEL/g" $MASTER_CFG
echo "Set leave space to $MFSC_LEAVE_SPACE"
sed -i "s/# HDD_LEAVE_SPACE_DEFAULT = 4GiB/HDD_LEAVE_SPACE_DEFAULT = $MFSC_LEAVE_SPACE/g" $MASTER_CFG

mfschunkserver -d
