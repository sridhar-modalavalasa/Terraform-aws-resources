terraform {
  backend "s3" {
    bucket         = "my-fb-app-bucket"
    region         = "us-east-1"
    key            = "Three-Tier-DevSecOps-Project/EKS-TF/terraform.tfstate"
  }
  required_version = ">=0.13.0"
  required_providers {
    aws = {
      version = ">= 2.7.0"
      source  = "hashicorp/aws"
    }
  }
}
