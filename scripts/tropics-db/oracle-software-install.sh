#!/bin/bash

sh /home/oracle/oracle-db/runInstaller -silent -waitforcompletion -showProgress -responseFile /home/oracle/oracle-db/response/oracle-software-install.rsp

exit $?