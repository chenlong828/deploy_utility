#!/bin/bash


template_file="ubuntu-base.tar.gz"
template_dest="ubuntu-base"
dns_server="61.139.2.69"

function create_lxc(){
if [ -e $template_file ]; then
	tar -xpf $template_file 
	mv $template_dest $1
fi

if [ -e $1/config ]; then
	bridge_str="s/lxcbr0/"$2"/"
	dir_str="s/"$template_dest"/"$1"/"
	sed -i $bridge_str $1/config
	sed -i $dir_str $1/config
fi

etc_profile=$1"/rootfs/etc"

network_profile=$etc_profile"/network/interfaces"
host_profile=$etc_profile"/hostname"
dns_profile=$etc_profile"/resolvconf/resolv.conf.d/original"

if [ -e $network_profile ]; then
	sed -i "s/dhcp/static/" $network_profile
	echo "	address "$3 >> $network_profile
	echo "	netmask 255.255.255.224" >> $network_profile
	echo "	gateway "$4 >> $network_profile
	echo " 	dns_nameserver 61.139.2.69" >> $network_profile
	cat $network_profile

	echo $1 > $host_profile
	cat $host_profile
	
	echo "nameserver "$dns_server > $dns_profile
	cat $dns_profile
fi
}

if [ $# != 4 ] ; then 
	echo "CTYUN Portal deploy script usage:"
	echo "	deploy.sh <lxc_name> <bridge_name> <ip_address> <gateway>"
	echo "	=============================="
	echo "	example deploy.sh portal_core lxcbr_v1102 192.168.13.33 192.168.13.62"
	echo ""
	echo ""
	exit 0
else
	create_lxc $1 $2 $3 $4
fi

