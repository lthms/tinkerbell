This repository contains the infrastructure-as-code and machine configuration
used to deploy [my personal website](https://soap.coffee/~lthms) on a single
Vultr VPS running Fedora CoreOS. It provisions the server with Terraform and
configures the host to run the website using Podman Quadlets units.

This repository reflects my own production setup and is not intended to be a
drop-in template.

If you want to learn more about it, I am currently writing an article
explaining this architecture in depth.

## Prerequisites

- Terraform
- Butane
- Vultr API key
- A `main.tfvars.json` file to define `vultr_api_key`

## Usage

1. Generate the Ignition config with `make main.ign`
2. Apply the Terraform plan with `make`
3. For subsequent deployments, simply call `make` again, but you can also use
   `make force` to replace the VM even if the Ignition config has not changed

**Note:** to deploy this setup yourself, you will need to modify the Caddyfile
to use your own domain name.
