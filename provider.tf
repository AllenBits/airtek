provider "aws" {
  region = var.region
  profile = var.profile
}

terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "~> 3.0"
    }
  }

  backend "s3" {
    bucket = "test-kubernetes-tf"
    key = "use1-aws-eks-cluster/terraform.tfstate"
    region = "us-east-1"
    dynamodb_table = "use1-aws-eks-cluster-tf-state"
    encrypt = true
  }
}