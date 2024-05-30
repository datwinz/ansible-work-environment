# Ansible virtual environment

This is a public instance of WIP Ansible playbooks to setup a virtual work environment. These playbooks are run on a Rocky Linux 8 server, but they will probably work with other Red Hat-like distributions.

## Playbook requirements

A user named ``ansible`` with sudo permissions to make libvirt virtual machines.

An ecdsa SSH key on this path: ```/home/ansible/.ssh/id_ecdsa```.

The repository to be cloned to the ansible home directory and to be renamed to playbooks. So the path of the git directory is ```/home/ansible/playbooks/```.

A few libvirt/KVM virtual machines: I manually made three virtual machine images named *small_UNSAFE_PASSWORD.qcow2*, *medium_UNSAFE_PASSWORD.qcow2* and *large_UNSAFE_PASSWORD.qcow2*. The small one is 25GB, medium 100GB and large 400GB. These are ***not*** part of this repository, so you have to make them yourself. The provisioning expects the images to be placed in this directory: ```/home/ansible/playbooks/images/```. The names of the images have *UNSAFE_PASSWORD* in them because they all have the same (easy) root password. You can find the password in ```inventories/root/host_vars/*/vars```. These unsafe passwords are removed later in the playbook.
