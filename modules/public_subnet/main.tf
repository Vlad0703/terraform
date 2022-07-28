resource "aws_subnet" "public" {
  vpc_id     = var.VPC_id
  cidr_block = "10.0.11.0/24"
  map_public_ip_on_launch = true

  tags = {
    Name = "Lesson13-public"
  }
}

resource "aws_route" "r" {
  route_table_id            = var.RT_id
  destination_cidr_block    = "0.0.0.0/0"
  gateway_id                = var.IGW_id
}

resource "aws_eip" "nat_gateway" {
  vpc = true
}

resource "aws_nat_gateway" "nat_gateway" {
  allocation_id = aws_eip.nat_gateway.id
  subnet_id = aws_subnet.public.id
  tags = {
    "Name" = "Lesson13-nat"
  }
}

