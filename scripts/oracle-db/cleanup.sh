#!/bin/bash -x

#Clean up oracle software directories
rm -rf /home/oracle/oracle-db-*
rm -rf /apps/oraInventory

#Shut down oracle database and listener
su - oracle -c "sqlplus / as sysdba <<EOF 
shutdown immediate; 
EOF"
su - oracle -c "lsnrctl stop" oracle

#Delete oracle vagrant database files
rm -f /apps/oradata/VAGRANT/*

#Clean up redhat interface persistence
rm -f /etc/udev/rules.d/70-persistent-net.rules

for ndev in $(ls /etc/sysconfig/network-scripts/ifcfg-*); do
  if [ "$(basename ${ndev})" != "ifcfg-lo" ]; then
    sed -i '/^HWADDR/d' ${ndev}
    sed -i '/^UUID/d' ${ndev}
  fi
done