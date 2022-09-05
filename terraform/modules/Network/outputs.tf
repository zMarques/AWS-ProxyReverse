output "subnets" {
  value = [aws_subnet.my_subnet.id, aws_subnet.my_subnet2.id]
}

output "sg" {
  value = [aws_security_group.my_sg.id]
}

