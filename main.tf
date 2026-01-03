terraform {
  required_providers {
    vultr = {
      source = "vultr/vultr"
      version = "2.28.0"
    }
  }
}

variable "vultr_api_key" {
  type = string
  description = "Vultr API key"
  sensitive = true
}

provider "vultr" {
  api_key = var.vultr_api_key
}

resource "vultr_instance" "tinkerbell" {
  region = "cdg"
  plan = "vc2-1c-1gb"
  os_id = "391"

  label = "tinkerbell"
  hostname = "tinkerbell"

  user_data = file("main.ign")
  reserved_ip_id = vultr_reserved_ip.tinkerbell.id
}

resource "vultr_reserved_ip" "tinkerbell" {
  region = "cdg"
  ip_type = "v4"
  label  = "soap-coffee-public"
}
