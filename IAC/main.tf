provider "aws" {
  region = var.aws_region
  default_tags {
    tags = {}
  }
}
module "ec2" {
  source        = "./modules/ec2"
  instance_type = [var.instance_type]
  key_name      = var.key_name
  subnet_id     = module.vpc.public_subnet_ids[0]
  ami_id        = var.ami_id
  vpc_id        = module.vpc.vpc_id
  aws_region    = var.aws_region
}
module "vpc" {
  source                      = "./modules/vpc"
  cidr_block                  = var.cidr_block
  subnet_block_public1        = var.subnet_block_public1
  subnet_block_public2        = var.subnet_block_public2
  subnet_block_private1       = var.subnet_block_private1
  subnet_block_private2       = var.subnet_block_private2
  availability_zone_public_1  = var.availability_zone_public_1
  availability_zone_public_2  = var.availability_zone_public_2
  availability_zone_private_1 = var.availability_zone_private_1
  availability_zone_private_2 = var.availability_zone_private_2
}
module "iam" {
  source = "./modules/iam"
}
module "ecr" {
  source        = "./modules/ecr"
  ecr_repo_name = var.ecr_repo_name
}
module "rds" {
  source       = "./modules/rds"
  db_username  = var.db_username
  db_password  = var.db_password
  vpc_id       = module.vpc.vpc_id
  subnet_ids   = module.vpc.private_subnet_ids
  allowed_cidr = var.allowed_cidr
}
module "eks" {
  vpc_id               = module.vpc.vpc_id
  source               = "./modules/eks"
  subnet_ids           = module.vpc.private_subnet_ids
  security_group_ids   = [module.ec2.security_group_id]
  eks_cluster_role_arn = module.iam.eks_role_arn
  node_group_role_arn  = module.iam.node_group_role_arn
  cluster_name         = var.cluster_name
  instance_types       = var.instance_types
  desired_capacity     = var.desired_capacity
  max_size             = var.max_size
  min_size             = var.min_size
}

