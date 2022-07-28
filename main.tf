terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
  }

  required_version = ">= 1.2.0"
}

provider "aws" {
  region = "us-east-1"
}

module "vpc" {
  source = "./modules/vpc"
}

module "public-subnet" {
  source = "./modules/public_subnet"
  VPC_id = module.vpc.vpc_id
  RT_id = module.vpc.rt_id
  IGW_id = module.gateaway.igw_id
}

module "private-subnet" {
  source = "./modules/private_subnet"
  VPC_id = module.vpc.vpc_id
  NAT_id = module.public-subnet.nat_id
}

module "gateaway" {
  source = "./modules/gateaway"
  VPC_id = module.vpc.vpc_id
}

module "groups" {
  source = "./modules/groups"
  VPC_id = module.vpc.vpc_id
}

module "servers" {
  source = "./modules/servers"
  VPC_id = module.vpc.vpc_id
  SG_id = module.groups.sg_id
  PUBL_id = module.public-subnet.publ_id
  PRIV_id = module.private-subnet.priv_id
}

# module "RDS" {
#   source = "./modules/rds"
#   VPC_id = module.vpc.vpc_id
# }

