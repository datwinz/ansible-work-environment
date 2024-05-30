#!/bin/bash
ansible-galaxy collection install -r requirements.yml
read -p "Is this your first run or not? y/N " initial_run
if [ $initial_run == "y" ]; then
	ansible-playbook -i inventories/main/hosts --ask-vault-pass 1_init_setup/make_vms.yml
	echo Waiting for VMs to startup
	sleep 15
	ansible-playbook -i inventories/root/hosts --ask-vault-pass 1_init_setup/setup_users.yml
else
	ansible-playbook -i inventories/main/hosts --ask-vault-pass 1_init_setup/make_vms.yml
	echo Waiting for VMs to startup
	sleep 15
fi
ansible-playbook -i inventories/root/hosts --ask-vault-pass 1_init_setup/remove_root.yml
ansible-playbook -i inventories/main/hosts --ask-vault-pass 1_init_setup/more_setup.yml
ansible-playbook -i inventories/main/hosts -i inventories/freeipa/hosts --ask-vault-pass 1_init_setup/setup_services.yml
ansible-playbook -i inventories/freeipa/hosts --ask-vault-pass 1_init_setup/setup_freeipa_after_signing.yml
