output "ec2_public_ip" {
  value = module.Ec2.public_ip
}

output "dns" {
  value = module.alb.dns
}
