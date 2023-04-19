#!/bin/bash

#delete install-dir
rm -rf /home/kni/install-dir

# create anew and populate
mkdir -p /home/kni/install-dir
cp /home/kni/agent-config.yaml /home/kni/install-dir/
cp /home/kni/install-config.yaml /home/kni/install-dir/

# generate images and place them into var/lib/libvirt/images
sudo rm -rf /var/lib/libvirt/images/agent.x86_64.iso

cd /home/kni/
openshift-install --dir install-dir/ agent create image
sudo cp /home/kni/install-dir/agent.x86_64.iso /var/lib/libvirt/images/

# rebuild the VMs and shut them down

sudo /root/create_ocp-vm-skeleton-singleiface.sh
