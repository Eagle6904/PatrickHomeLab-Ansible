######## Playbooks: list of playbooks ##########

.PHONY: ping audit baseline shutdown-media shutdown-vault shutdown-forge shutdown-all \
        update update-media update-vault update-forge install-curl ssh-setup install-htop


ping:
	ansible all -i inventory/hosts.ini -m ping

audit:
	ansible-playbook -i inventory/hosts.ini playbooks/audit.yml

baseline:
	ansible-playbook -i inventory/hosts.ini playbooks/baseline.yml

shutdown-media:
	ansible-playbook -i inventory/hosts.ini playbooks/shutdown.yml --limit media

shutdown-vault:
	ansible-playbook -i inventory/hosts.ini playbooks/shutdown.yml --limit vault

shutdown-forge:
	ansible-playbook -i inventory/hosts.ini playbooks/shutdown.yml --limit forge

shutdown-all:
	ansible-playbook -i inventory/hosts.ini playbooks/shutdown.yml

update:
	ansible-playbook -i inventory/hosts.ini playbooks/update.yml

update-media:
	ansible-playbook -i inventory/hosts.ini playbooks/update.yml --limit media

update-vault:
	ansible-playbook -i inventory/hosts.ini playbooks/update.yml --limit vault

update-forge:
	ansible-playbook -i inventory/hosts.ini playbooks/update.yml --limit forge

install-curl:
	ansible-playbook -i inventory/hosts.ini playbooks/install_curl.yml

ssh-setup:
	ansible-playbook -i inventory/hosts.ini playbooks/ssh_setup.yml

install-htop:
	ansible-playbook -i inventory/hosts.ini playbooks/install_htop.yml


