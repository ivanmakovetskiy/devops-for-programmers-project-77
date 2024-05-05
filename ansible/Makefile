prepare:
	ansible-galaxy install -r requirements.yml
	ansible-playbook --vault-password-file vault-password prepare.yml -i inventory.ini -vvv

deploy:
	ansible-playbook deploy.yml --vault-password-file vault-password -i inventory.ini -vvv

encrypt:
	ansible-vault encrypt group_vars/webservers/vault.yml

decrypt:
	ansible-vault decrypt group_vars/webservers/vault.yml

edit:
	ansible-vault edit group_vars/webservers/vault.yml
