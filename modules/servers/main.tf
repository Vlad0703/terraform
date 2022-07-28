resource "aws_instance" "bastion" {
  ami           = "ami-052efd3df9dad4825"
  instance_type = "t2.micro"
  subnet_id = var.PUBL_id
  vpc_security_group_ids = [var.SG_id]
  key_name = "boldusov"
  tags = {
    Name = "bastion"
  }
}

resource "aws_instance" "private_serv" {
  ami           = "ami-052efd3df9dad4825"
  instance_type = "t2.micro"
  subnet_id = var.PRIV_id
  vpc_security_group_ids = [var.SG_id]
  key_name = "boldusov"
  tags = {
    Name = "private_serv"
  }
}