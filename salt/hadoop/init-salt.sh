#!/bin/bash

saltmaster_host="saltstack"
saltmaster_hostip="172.22.241.156"
host_name=$1

echo $1 > /etc/hostname
sed -i "s/localhost.cs2cloud.internal/"$host_name"/" /etc/hosts

apt-get install python-software-properties -y
add-apt-repository ppa:saltstack/salt -y
apt-get update
sudo apt-get install salt-minion -y
sed -i "s/#master: salt/master: "$saltmaster_host"/" /etc/salt/minion

echo $saltmaster_hostip"	"$saltmaster_host >> /etc/hosts
/etc/init.d/salt-minion restart

mkdir /dfs
mkfs.ext3 /dev/sdb
echo -e "/dev/sdb\t/dfs\text3\tdefaults\t0\t0" >> /etc/fstab
mount -a