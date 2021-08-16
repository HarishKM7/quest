terraform {
  required_version = ">= 1.0.4"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 3.54.0"
    }
  }
}

provider "aws" {
  # Take access keys from environment
  region = var.aws_region
}
