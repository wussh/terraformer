provider "aws" {
  region = "ap-northeast-3"
}

terraform {
	required_providers {
		aws = {
	    version = "~> 5.100.0"
		}
  }
}
