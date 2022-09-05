terraform -chdir=./terraform apply -var-file=env.tfvars --auto-approve

ANSIBLE_HOST_KEY_CHECKING=False ansible-playbook ./ansible/install-docker.yaml -i ./hosts