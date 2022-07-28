resource "aws_internet_gateway" "gw" {
  vpc_id = var.VPC_id

  tags = {
    Name = "Lesson13-IGW"
  }
}