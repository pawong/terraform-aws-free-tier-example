terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.47.0"
    }
  }
  backend "s3" {
    bucket = "terraform-aws-free-tier-example"
    key    = "terraform/terraform.tfstate"
    region = "us-west-2"
  }
}
