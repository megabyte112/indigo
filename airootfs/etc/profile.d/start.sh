#!/bin/bash

# clone os-release
ln -sf /etc/os-release /usr/lib/os-release

# overwrite arch's lsb-release
rm -f /etc/lsb-release
echo "DISTRIB_ID='Indigo'
DISTRIB_RELEASE='rolling'
DISTRIB_DESCRIPTION='Indigo Linux'" >> /etc/lsb-release

# make install script executable
chmod +x /etc/indigo-installer/indigoinstall

# make symlink from installer to /root/install
ln -sf /etc/indigo-installer/indigoinstall /root/install

# remove fish welcome message
echo "set fish_greeting" >> /etc/fish/config.fish

