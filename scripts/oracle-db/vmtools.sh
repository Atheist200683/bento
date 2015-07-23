#!/bin/sh -eux

mkdir /tmp/vbox
VER=$(cat /home/oracle/.vbox_version)
mount -o loop /home/oracle/VBoxGuestAdditions_$VER.iso /tmp/vbox
sh /tmp/vbox/VBoxLinuxAdditions.run
umount /tmp/vbox
rmdir /tmp/vbox
rm -f /home/oracle/VBoxGuestAdditions_$VER.iso /home/oracle/VBoxGuestAdditions_$VER.iso.?