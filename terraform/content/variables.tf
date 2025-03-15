variable "cluster_endpoint" {
  type      = string
  sensitive = false
}

variable "cluster_token" {
  type      = string
  sensitive = true
}

variable "cluster_ca_certificate" {
  type      = string
  sensitive = true
}

variable "OP_TOKEN" {
  type      = string
  sensitive = true
}

variable "OP_CREDENTIALS" {
  type      = string
  sensitive = true
}

variable "ARGOCD_USERNAME" {
  type      = string
  sensitive = true
  default   = null
}

variable "ARGOCD_PASSWORD" {
  type      = string
  sensitive = true
  default   = null
}
