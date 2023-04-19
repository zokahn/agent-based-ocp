#!/bin/bash

BENCH='/home/kni/git/agent-based-ocp'

#delete install-dir
rm -rf ${BENCH}/install-dir

# create anew and populate
mkdir -p ${BENCH}/install-dir
cp ${BENCH}/agent-config.yaml ${BENCH}/install-dir/
cp ${BENCH}/install-config.yaml ${BENCH}/install-dir/

# generate images and place them into var/lib/libvirt/images
sudo rm -rf /var/lib/libvirt/images/agent.x86_64.iso

cd /home/kni/
openshift-install --dir ${BENCH}/install-dir/ agent create image
sudo cp ${BENCH}/install-dir/agent.x86_64.iso /var/lib/libvirt/images/

# rebuild the VMs and shut them down

sudo ${BENCH}/create_ocp-vm-skeleton-singleiface.sh
