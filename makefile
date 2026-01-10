TEMPLATES = $(wildcard files/*.mustache)
FILES = $(wildcard files/*) $(TEMPLATES:.mustache=)

%: %.mustache
	yq -oy -p=hcl main.tfvars | mustache $< > $@

.PHONY: deploy
deploy: main.ign
	terraform apply -var-file=main.tfvars

.PHONY: plan
plan: main.ign
	terraform plan -var-file=main.tfvars

.PHONY: force
force: main.ign
	terraform apply -var-file=main.tfvars

main.ign: main.bu $(FILES)
	butane -d . $< > $@
