variable "private_key_algorithm" {
  type    = string
  default = "ECDSA"
}

variable "private_key_ecdsa_curve" {
  type    = string
  default = "P256"
}

variable "private_key_rsa_bits" {
  type    = string
  default = "2048"
}

variable "organization_name" {
  type = string
}

variable "common_name" {
  type = string
}

variable "validity_period_hours" {
  type        = string
  default     = 8760
  description = "Default validity is 8760 hours which is 1 year"
}

variable "allowed_uses" {
  type = list(string)
  default = [
    "key_encipherment",
    "digital_signature",
    "server_auth",
  ]
}

variable "dns_names" {
  type    = list(string)
  default = null
}

variable "ip_addresses" {
  type    = list(string)
  default = null
}
