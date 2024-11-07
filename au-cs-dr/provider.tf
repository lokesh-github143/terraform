// provider for AU-DR env

terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.54.1"
    }
  }
}

# Provider configuration 
provider "aws" {
  region = "ap-southeast-4"
}
