#!/bin/bash

/home/oracle/oracle-db-software/runInstaller -silent -waitforcompletion -responseFile /home/oracle/oracle-db-resources/install-oracle-vagrant-db.rsp || true

exit $?