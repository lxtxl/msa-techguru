.PHONY: init
init:
	tofu init

.PHONY: plan
plan:
	tofu plan

.PHONY: apply
apply:
	tofu apply -auto-approve=true -var-file=terraform.tfvars

.PHONY: destroy
destroy:
	tofu destroy -auto-approve=true -var-file=terraform.tfvars

.PHONY: clean
clean:
	rm -rf .terraform
	rm -rf .terraform.lock.hcl
	rm -rf terraform.tfstate*
