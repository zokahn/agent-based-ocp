# agent-based-ocp
Libvirt lab to document and explore agent based installed OCP


## Introduction


## Prep the environment to include the OpenShift kni user and binaries

'''
useradd kni
passwd --delete kni
echo "kni ALL=(root) NOPASSWD:ALL" | tee -a /etc/sudoers.d/kni
chmod 0440 /etc/sudoers.d/kni
usermod --append --groups libvirt kni

su - kni -c "ssh-keygen -t ed25519 -f /home/kni/.ssh/id_rsa -N ''"
'''
