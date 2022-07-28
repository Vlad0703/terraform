resource "aws_subnet" "private" {
  vpc_id     = var.VPC_id
  cidr_block = "10.0.12.0/24"

  tags = {
    Name = "Lesson13-private"
  }
}

resource "aws_route_table" "private" {
  vpc_id = var.VPC_id
  route {
    cidr_block = "0.0.0.0/0"
    nat_gateway_id = var.NAT_id
  }

  tags = {
    Name = "private-rt"
  }
}

resource "aws_route_table_association" "private" {
  subnet_id      = aws_subnet.private.id
  route_table_id = aws_route_table.private.id
}