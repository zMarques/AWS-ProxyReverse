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

variable "ami" {
  type    = string
  default = "ami-08d4ac5b634553e16"
}

variable "instance_type" {
  type    = string
  default = "t3.nano"
}

variable "ssh_public_key" {
  type = string
}

variable "subnet_id" {
  type = string
}

variable "sg" {
  type = string
}

variable "instance_tags" {
  type    = map(string)
  default = null
}