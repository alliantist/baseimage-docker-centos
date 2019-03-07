#!/bin/bash
set -e
source /bd_build/buildconfig
set -x

## Prevent initramfs updates from trying to run grub and lilo.
## https://journal.paul.querna.org/articles/2013/10/15/docker-ubuntu-on-rackspace/
## http://bugs.debian.org/cgi-bin/bugreport.cgi?bug=594189
export INITRD=no
mkdir -p /etc/container_environment
echo -n no > /etc/container_environment/INITRD

## Upgrade all packages.
#apt-get dist-upgrade -y --no-install-recommends -o Dpkg::Options::="--force-confold"
rpm -Uvh https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm
yum update -y

## Fix locale.
echo -n en_GB.UTF-8 > /etc/container_environment/LANG
echo -n en_GB.UTF-8 > /etc/container_environment/LC_CTYPE
