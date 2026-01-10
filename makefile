TEMPLATES = $(wildcard files/*.mustache)
FILES = $(wildcard files/*) $(TEMPLATES:.mustache=)

%: %.mustache
	mustache main.tfvars.json $< > $@

.PHONY: deploy
deploy: main.ign
	terraform apply -var-file=main.tfvars.json

.PHONY: plan
plan: main.ign
	terraform plan -var-file=main.tfvars.json

.PHONY: force
force: main.ign
	terraform apply -var-file=main.tfvars.json -replace=vultr_instance.tinkerbell

main.ign: main.bu $(FILES)
	butane -d . $< > $@
