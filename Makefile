PONY: help

help:
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

init: ## Initalise terraform
	terraform init terraform

plan: ## See terraform plan
	terraform plan -var-file="terraform/secrets.tfvars" terraform 

apply: ## Apply terraform
	terraform apply -var-file="terraform/secrets.tfvars" terraform 

destroy: ## Destroy terraform
	terraform destroy -var-file="terraform/secrets.tfvars" terraform 

k3s-install: ## Install k3s on given node ($SERVER_IP)
	k3sup install \
	  --ip $(SERVER_IP) \
	  --user root \
	  --cluster \
	  --k3s-version v1.19.9+k3s1 \
	  --k3s-extra-args '--no-deploy traefik' \
	  --ssh-key $(HOME)/.ssh/do_rsa

k3s-join: ## Join NODE_IP to SERVER_IP
	k3sup join \
	  --server-ip  $(SERVER_IP) --ip $(NODE_IP) \
	  --user root \
	  --k3s-version v1.19.9+k3s1 \
	  --k3s-extra-args '--no-deploy traefik' \
	  --ssh-key $(HOME)/.ssh/do_rsa \
	  --server

