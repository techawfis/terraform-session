terraform {
  backend "s3" {
    bucket         = "github-actions-oidc-s3-bucket"
    key            = "env:/terraform.tfstate"
    region         = "ap-south-1"
  }

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = var.aws_region
}
