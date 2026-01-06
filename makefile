FILES = $(wildcard files/*)

.PHONY: deploy
deploy: main.ign
	terraform apply -var-file=main.tfvars.json

.PHONY: force
force: main.ign
	terraform apply -var-file=main.tfvars.json -replace=vultr_instance.tinkerbell

main.ign: main.bu $(FILES)
	butane -d . $< > $@
