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

variable "subnets" {
  type = list(string)
}

variable "security_groups_id" {
  type = set(string)
}

variable "ssl" {
  type = object({
    cert_arn = string
  })
  default = null
}


locals {
  subnets = toset(var.subnets)
}