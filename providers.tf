provider "vultr" {
  api_key = var.vultr_api_key
}

terraform {
  required_providers {
    vultr = {
      source = "vultr/vultr"
      version = "2.28.0"
    }
  }
}

