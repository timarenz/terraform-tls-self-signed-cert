resource "tls_private_key" "main" {
  algorithm   = var.private_key_algorithm
  ecdsa_curve = var.private_key_algorithm == "ECDSA" ? var.private_key_ecdsa_curve : null
  rsa_bits    = var.private_key_algorithm == "RSA" ? var.private_key_rsa_bits : null
}

resource "tls_self_signed_cert" "main" {
  key_algorithm   = tls_private_key.main.algorithm
  private_key_pem = tls_private_key.main.private_key_pem

  subject {
    common_name  = var.common_name
    organization = var.organization_name
  }

  validity_period_hours = var.validity_period_hours
  allowed_uses          = var.allowed_uses
  dns_names             = var.dns_names == null ? tolist([var.common_name]) : concat(var.dns_names, tolist([var.common_name]))
  ip_addresses          = var.ip_addresses == null ? null : var.ip_addresses
}
