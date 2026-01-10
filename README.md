This repository contains the infrastructure-as-code and machine configuration
used to deploy [my personal website](https://soap.coffee/~lthms) on a single
Vultr VPS running Fedora CoreOS. It provisions the server with Terraform and
configures the host to run the website using Podman Quadlets units.

This repository reflects my own production setup and is not intended to be a
drop-in template.

If you want to learn more about it, I wrote [an article] explaining this
architecture in depth.

[an article]: https://soap.coffee/~lthms/posts/i-cannot-ssh-into-my-server-anymore.html

## Prerequisites

- `mise`
- Vultr API key
- `main.tfvars` file to define `vultr_api_key` and `domain`

## Usage

1. `mise install` to get the necessary dev tools (`terraform`, `jq`,
   `mustache`, `butane`)
2. `make plan` to see what changes can be deployed
3. `make` to deploy
