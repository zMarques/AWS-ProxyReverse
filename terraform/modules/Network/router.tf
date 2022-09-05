resource "aws_internet_gateway" "my_igw" {
  vpc_id = aws_vpc.my_vpc.id
  tags = {
    Name = "${var.projeto}-igw"
  }
}

resource "aws_default_route_table" "my_rtb" {
  default_route_table_id = aws_vpc.my_vpc.default_route_table_id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.my_igw.id
  }

  tags = {
    Name = "${var.projeto}-rtb"
  }
}