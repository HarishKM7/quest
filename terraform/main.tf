terraform {
  required_version = ">= 1.0.4"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 3.54.0"
    }
  }

  # To create this infra in your own AWS account,
  # remove this backend block.
  backend "remote" {
    organization = "HarishKM"
    workspaces { name = "quest" }
  }
}

provider "aws" {
  # Take access keys from environment
  region = var.aws_region
}
