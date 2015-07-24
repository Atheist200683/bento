#!/bin/bash -x

/home/oracle/oracle-db/runInstaller -silent -waitforcompletion -showProgress -responseFile /home/oracle/resources/install-oracle-vagrant-db.rsp

exit $?