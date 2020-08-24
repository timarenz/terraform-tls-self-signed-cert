output "private_key" {
  value     = tls_private_key.main.private_key_pem
  sensitive = true
}

output "certificate" {
  value = tls_self_signed_cert.main.cert_pem
}
