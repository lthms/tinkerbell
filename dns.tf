resource "vultr_dns_domain" "public" {
  domain = var.domain
}

resource "vultr_dns_record" "live" {
  domain = vultr_dns_domain.public.domain
  name = ""
  type = "A"
  data = vultr_reserved_ip.tinkerbell.subnet
  ttl = 300
}

resource "vultr_dns_record" "staging" {
  domain = vultr_dns_domain.public.domain
  name = "staging"
  type = "A"
  data = vultr_reserved_ip.tinkerbell.subnet
  ttl = 300
}
