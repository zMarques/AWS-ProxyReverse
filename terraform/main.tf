terraform {

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "4.27.0"
    }

    local = {
      source  = "hashicorp/local"
      version = "2.2.3"
    }
  }
}

provider "aws" {
  region  = var.aws_region
  profile = var.aws_profile
}

module "network" {
  source  = "./modules/Network"

  region  = var.aws_region
  profile = var.aws_profile
  projeto = var.projeto

  ports   = [22, 80, 443]
}

module "alb" {

  source  = "./modules/Alb"

  region  = var.aws_region
  profile = var.aws_profile
  projeto = var.projeto

  subnets            = module.network.subnets
  security_groups_id = module.network.sg
  ssl = {
    cert_arn = var.ssl_cert_arn
  }
}

module "Ec2" {
  source  = "./modules/Ec2"

  region  = var.aws_region
  profile = var.aws_profile
  projeto = var.projeto

  ssh_public_key = var.ssh_public_key
  subnet_id = module.network.subnets[0]
  sg = module.network.sg[0]
}

resource "local_file" "host-file" {
  content  = module.Ec2.public_ip
  filename = "../hosts"
}