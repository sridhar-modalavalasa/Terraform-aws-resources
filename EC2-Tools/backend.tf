terraform {
  backend "s3" {
    bucket         = "my-spring-app"
    region         = "us-east-1"
    key            = "Springboot-DevSecOps-Project/Jenkins-Server-TF/terraform.tfstate"
  }
  required_version = ">=0.13.0"
  required_providers {
    aws = {
      version = ">= 2.7.0"
      source  = "hashicorp/aws"
    }
  }
}