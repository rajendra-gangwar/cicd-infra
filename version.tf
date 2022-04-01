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
     }
}

provider "aws" {
  region  = "us-east-1"
  profile = "root"
  # Configuration options
}