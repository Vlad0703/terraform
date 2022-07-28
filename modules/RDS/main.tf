resource "aws_subnet" "db1" {
  vpc_id     = var.VPC_id
  cidr_block = "10.0.13.0/24"
  availability_zone = "us-east-1a"

  tags = {
    Name = "Lesson13-db"
  }
}


resource "aws_subnet" "db2" {
  vpc_id     = var.VPC_id
  cidr_block = "10.0.14.0/24"
  availability_zone = "us-east-1b"
  tags = {
    Name = "Lesson13-db"
  }
}

resource "aws_subnet" "db3" {
  vpc_id     = var.VPC_id
  cidr_block = "10.0.15.0/24"
  availability_zone = "us-east-1c"

  tags = {
    Name = "Lesson13-db"
  }
}

resource "aws_db_subnet_group" "default" {
  name       = "main"
  subnet_ids = [aws_subnet.db1.id, aws_subnet.db2.id, aws_subnet.db3.id]

  tags = {
    Name = "db_sub_group"
  }
}

resource "aws_rds_cluster" "example" {
  cluster_identifier        = "example"
  availability_zones        = ["us-east-1a", "us-east-1b", "us-east-1c"]
  engine                    = "postgres"
  db_cluster_instance_class = "db.m5d.xlarge"
  storage_type              = "io1"
  allocated_storage         = 100
  iops                      = 1000
  master_username           = "postgres"
  master_password           = "12341234"
  db_subnet_group_name      = "main"
}