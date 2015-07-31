#!/bin/sh -eux

set -x

#See https://support.oracle.com/epmos/faces/SearchDocDisplay?_adf.ctrl-state=6k1kbutw3_426&_afrLoop=456603840459010 for OAS EL5.X installation requirements.
#See http://docs.oracle.com/cd/B14099_19/lop.1012/install.1012/install/silent.htm for silent installation documentation.

BLUE='\033[1;34m'

echo -e "${BLUE}Downloading and installing the Oracle Linux Yum repository file."
wget -q http://public-yum.oracle.com/public-yum-el5.repo -O /etc/yum.repos.d/public-yum-el5.repo

echo -e "${BLUE}Downloading and installing the required RPM packages as per Oracle support note 564174.1."
sudo yum -y --nogpgcheck install binutils
sudo yum -y --nogpgcheck install gcc
sudo yum -y --nogpgcheck install gcc-c++
sudo yum -y --nogpgcheck install compat-db
sudo yum -y --nogpgcheck install libXp

exit $?

set +x