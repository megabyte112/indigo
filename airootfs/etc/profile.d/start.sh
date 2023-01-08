#!/bin/bash

# clone os-release
ln -f /etc/os-release /usr/lib/os-release

# overwrite arch's lsb-release
rm -f /etc/lsb-release
echo "DISTRIB_ID='Indigo'
DISTRIB_RELEASE='rolling'
DISTRIB_DESCRIPTION='Indigo Linux'" >> /etc/lsb-release

# make install script executable
chmod +x /root/install

