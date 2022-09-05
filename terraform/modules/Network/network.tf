resource "aws_vpc" "my_vpc" {
  cidr_block = "172.16.0.0/16"

  tags = {
    Name = "${var.projeto}-vpc"
  }
}

resource "aws_subnet" "my_subnet" {
  vpc_id            = aws_vpc.my_vpc.id
  cidr_block        = "172.16.11.0/24"
  availability_zone = "${var.region}a"

  tags = {
    Name = "${var.projeto}-sub_net1"
  }
}

resource "aws_subnet" "my_subnet2" {
  vpc_id            = aws_vpc.my_vpc.id
  cidr_block        = "172.16.10.0/24"
  availability_zone = "${var.region}b"

  tags = {
    Name = "${var.projeto}-sub_net2"
  }
}

resource "aws_security_group" "my_sg" {
  vpc_id = aws_vpc.my_vpc.id

  dynamic "ingress" {
    for_each = local.ingress_ports
    content {
      from_port   = ingress.value
      to_port     = ingress.value
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "${var.projeto}-scg"
  }

}

