#!/bin/bash

mkdir -p /apps
chown -R oracle:oinstall /apps

awk '$2=="/dev/shm"{$4="defaults,size=1G"}1' /etc/fstab > /etc/fstab.tmp && mv /etc/fstab.tmp /etc/fstab
umount tmpfs
mount -a

echo "####Oracle specific environment variables added by Packer - DO NOT MODIFY THESE!#####" >> /home/oracle/.bash_profile
echo "TMP=/tmp; export TMP" >> /home/oracle/.bash_profile
echo "TMPDIR=\$TMP; export TMPDIR" >> /home/oracle/.bash_profile
echo "ORACLE_HOSTNAME=localhost.localdomain; export ORACLE_HOSTNAME" >> /home/oracle/.bash_profile
echo "ORACLE_UNQNAME=TRPS; export ORACLE_UNQNAME" >> /home/oracle/.bash_profile
echo "ORACLE_BASE=/apps/oracle; export ORACLE_BASE" >> /home/oracle/.bash_profile
echo "ORACLE_HOME=\$ORACLE_BASE/product/11.2.0/dbhome_1; export ORACLE_HOME" >> /home/oracle/.bash_profile
echo "ORACLE_SID=TRPS; export ORACLE_SID" >> /home/oracle/.bash_profile
echo "LD_LIBRARY_PATH=\$ORACLE_HOME/lib:/lib:/usr/lib; export LD_LIBRARY_PATH" >> /home/oracle/.bash_profile
echo "CLASSPATH=\$ORACLE_HOME/jlib:\$ORACLE_HOME/rdbms/jlib; export CLASSPATH" >> /home/oracle/.bash_profile
echo "PATH=/usr/sbin:\$PATH; export PATH" >> /home/oracle/.bash_profile
echo "PATH=\$ORACLE_HOME/bin:\$PATH; export PATH" >> /home/oracle/.bash_profile
echo "DISPLAY=\$(netstat -rn | grep 'UG' | awk '{print \$2}'):0.0; export DISPLAY" >> /home/oracle/.bash_profile
source /home/oracle/.bash_profile

echo "inventory_loc=/apps/oraInventory" > /etc/oraInst.loc
echo "inst_group=oinstall" >> /etc/oraInst.loc
chown oracle:oinstall /etc/oraInst.loc
chmod 664 /etc/oraInst.loc

chown -R oracle:oinstall /home/oracle/oracle-db
chmod -R 774 /home/oracle/oracle-db