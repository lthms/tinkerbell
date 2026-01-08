variable "vultr_api_key" {
  type = string
  description = "Vultr API key"
  sensitive = true
}

variable "domain" {
  type = string
  description = "Website public domain"
  sensitive = false
}
