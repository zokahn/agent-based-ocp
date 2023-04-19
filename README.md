# agent-based-ocp
Libvirt lab to document and explore agent based installed OCP


## Introduction


## Prep the environment to include the OpenShift kni user and binaries

Create the KNI user and make sure it can use the sudo facility

```
useradd kni
passwd --delete kni
echo "kni ALL=(root) NOPASSWD:ALL" | tee -a /etc/sudoers.d/kni
chmod 0440 /etc/sudoers.d/kni
usermod --append --groups libvirt kni

su - kni -c "ssh-keygen -t ed25519 -f /home/kni/.ssh/id_rsa -N ''"
```

As the user kni download the installation binary
```
_DIR=/home/kni/
_URL="https://mirror.openshift.com/pub/openshift-v4/clients/ocp/${_VERSION}"

_VERSION=stable-4.12

curl -s ${_URL}/openshift-install-linux.tar.gz | tar zxvf - openshift-install
sudo mv -f openshift-install /usr/local/bin
```
Download the other binaries to operate the cluster
```
_DIR=/home/kni/
_VERSION=stable-4.12
_URL="https://mirror.openshift.com/pub/openshift-v4/clients/ocp/${_VERSION}"

curl -s ${_URL}/openshift-client-linux.tar.gz | tar zxvf - oc kubectl
sudo mv -f oc /usr/local/bin
sudo mv -f kubectl /usr/local/bin
```
Download the pull secret to be able to download the container files from the Red Hat Registries


Download the pull-secret [RH Portal](https://console.redhat.com/openshift/install/pull-secret)
