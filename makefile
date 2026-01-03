FILES = $(wildcard files/*)

.PHONY: deploy
deploy: main.ign
	terraform apply -var-file=main.tfvars -replace=vultr_instance.tinkerbell -auto-approve

main.ign: main.bu $(FILES)
	butane -d . $< > $@
