#!/bin/bash

ISO='/var/lib/libvirt/images/agent.x86_64.iso'

nodes="master0 master1 master2"
NUM=1
for node in $nodes; do
    echo "Adding iso to $node"
    sudo virt-xml "${node}" --add-device --disk "${ISO}",device=cdrom,target.dev=sdc
    sudo virt-xml "${node}" --edit target=sda --disk="boot_order=1"
    sudo virt-xml "${node}" --edit target=sdc --disk="boot_order=2" --start
done
