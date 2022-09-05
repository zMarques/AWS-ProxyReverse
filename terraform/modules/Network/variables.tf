variable "region" {
  type    = string
  default = "us-east-1"
}

variable "profile" {
  type    = string
  default = "default"
}

variable "projeto" {
  type = string
}

variable "ports" {
  type    = list(number)
  default = [22, 443, 80]
}

locals {
  ingress_ports = toset(var.ports)
}