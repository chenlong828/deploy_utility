#!/bin/bash

saltmaster_host="lxc-host1"
saltmaster_hostip="192.168.13.1"
host_name=$1

echo $1 > /etc/hostname
sed -i "s/ubuntu-base/"$host_name"/" /etc/hosts

apt-get install python-software-properties -y
add-apt-repository ppa:saltstack/salt -y
apt-get update
sudo apt-get install salt-minion -y
sed -i "s/#master: salt/master: "$saltmaster_host"/" /etc/salt/minion

echo $saltmaster_hostip"	"$saltmaster_host >> /etc/hosts
/etc/init.d/salt-minion restart
