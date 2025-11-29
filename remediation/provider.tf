terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.100.0"
    }
  }
  required_version = ">= 1.0"
}

# Default provider
provider "aws" {
  region = "eu-west-1"
}

