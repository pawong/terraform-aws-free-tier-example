provider "aws" {
  profile = var.profile
  region  = var.region
}

module "vpc" {
  source       = "../modules/vpc"
  project_name = var.project_name
}

module "subnets" {
  source = "../modules/subnets"

  vpc_id = module.vpc.vpc_id
}

module "security_group" {
  source = "../modules/security-group"

  vpc_id = module.vpc.vpc_id
}

module "iam" {
  source = "../modules/iam"
}

module "lambda" {
  source = "../modules/lambda"

  vpc_id            = module.vpc.vpc_id
  iam_role_arn      = module.iam.role_arn
  subnet_ids        = module.subnets.subnet_ids
  security_group_id = module.security_group.security_group_id
}
