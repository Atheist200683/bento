#!/bin/bash -x

/home/oracle/oracle-db-software/runInstaller -silent -waitforcompletion -showProgress -responseFile /home/oracle/oracle-db-resources/install-oracle-vagrant-db.rsp

exit $?