provider "aws" {
  region = var.region
}

module "vpc" {
  source       = "../modules/vpc"
  project_name = var.project_name
}

module "subnets" {
  source = "../modules/subnets"

  project_name = var.project_name
  vpc_id       = module.vpc.vpc_id
}

module "security_group" {
  source = "../modules/security-group"

  project_name = var.project_name
  vpc_id       = module.vpc.vpc_id
}

module "iam" {
  source = "../modules/iam"

  project_name = var.project_name
}

module "lambda" {
  source = "../modules/lambda"

  project_name      = var.project_name
  vpc_id            = module.vpc.vpc_id
  iam_role_arn      = module.iam.role_arn
  subnet_ids        = module.subnets.subnet_ids
  security_group_id = module.security_group.security_group_id
}
