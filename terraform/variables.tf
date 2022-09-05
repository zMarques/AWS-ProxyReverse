variable "aws_profile" {
  type    = string
  default = "default"
}

variable "aws_region" {
  type    = string
  default = "us-east-1"
}

variable "projeto" {
  type    = string
}

variable "ssh_public_key" {
  type = string
}

variable "ssl_cert_arn" {
  type = string
  default = null
}