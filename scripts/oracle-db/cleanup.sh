#!/bin/bash -x

#Clean up after Oracle DB install
rm -rf /home/oracle/oracle-db
rm -rf /apps/oraInventory

#Clean up Yum cache
yum -y clean all

#Clean up redhat interface persistence
rm -f /etc/udev/rules.d/70-persistent-net.rules

for ndev in $(ls /etc/sysconfig/network-scripts/ifcfg-*); do
  if [ "$(basename ${ndev})" != "ifcfg-lo" ]; then
    sed -i '/^HWADDR/d' ${ndev}
    sed -i '/^UUID/d' ${ndev}
  fi
done