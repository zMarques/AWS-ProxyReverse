resource "aws_instance" "my_ec2" {
  ami                         = var.ami
  instance_type               = var.instance_type
  key_name                    = aws_key_pair.ssh_key.key_name
  subnet_id                   = var.subnet_id
  associate_public_ip_address = true

  tags = var.instance_tags
}

resource "aws_network_interface_sg_attachment" "sg_attachment" {
  security_group_id    = var.sg
  network_interface_id = aws_instance.my_ec2.primary_network_interface_id
}

resource "aws_key_pair" "ssh_key" {
  public_key = var.ssh_public_key

  tags = {
    Name = "${var.projeto}-ssh_key"
  }
}