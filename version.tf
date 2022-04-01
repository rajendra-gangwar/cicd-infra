terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "4.5.0"

    }
    random = {
      source  = "hashicorp/random"
      version = "3.1.2"
    }
  }
  backend "s3" {
    bucket         = "terraform-aws-1422"
    key            = "terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "terraform"
    encrypt        = true
    profile        = "root"
  }
}

provider "aws" {
  region  = "us-east-1"
  profile = "root"
  # Configuration options
}