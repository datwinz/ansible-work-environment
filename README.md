# Ansible virtual environment

This is a public instance of WIP Ansible playbooks to setup a virtual work environment. These playbooks are run on a Rocky Linux 8 server, but they will probably work with other Red Hat-like distributions.

## Playbook requirements

A user named ``ansible`` with sudo permissions to make libvirt virtual machines.

An ecdsa SSH key on this path: ```/home/ansible/.ssh/id_ecdsa```.

The repository to be cloned to the ansible home directory and to be renamed to playbooks. So the path of the git directory is ```/home/ansible/playbooks/```.

A few libvirt/KVM virtual machines: I manually made three virtual machine images named *small_UNSAFE_PASSWORD.qcow2*, *medium_UNSAFE_PASSWORD.qcow2* and *large_UNSAFE_PASSWORD.qcow2*. The small one is 25GB, medium 100GB and large 400GB. These are ***not*** part of this repository, so you have to make them yourself. The provisioning expects the images to be placed in this directory: ```/home/ansible/playbooks/images/```. The names of the images have *UNSAFE_PASSWORD* in them because they all have the same (easy) root password. You can find the password in ```inventories/root/host_vars/*/vars```. These unsafe passwords are removed later in the playbook.

The images I made are available under these links:
[small_UNSAFE_PASSWORD.qcow2](https://mega.nz/file/mEsxWDDT#4_iM-88v-fkKCeu9KzVD7fs8y8pVEcKy5NjMEWTZSEs), 
[medium_UNSAFE_PASSWORD.qcow2](https://mega.nz/file/2Uc01CxC#AmPXfcsjKmbgX5fC5kd90o6giSBWhP5qmb40QaqdySE), 
[large_UNSAFE_PASSWORD.qcow2](https://mega.nz/file/qVkQCB7J#N1pMehu0-36SXcc47iT0OvA9TJBA0dckIjG-6BSepyE).

The checksums of these images are:

```
3c56d440ff34b63296633076c90b57244f892ac6463dafdde866adc2a37d66ff  small_UNSAFE_PASSWORD.qcow2
ef880765f58bdaaadc2bde5743f19596490ff7549ac144d18596f3407be38752  medium_UNSAFE_PASSWORD.qcow2
1cfeac6ca57e1537c290f2c5cd60718168083a97b765bd252679d5972796b864  large_UNSAFE_PASSWORD.qcow2
```
