terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.57.0"
    }
  }
}

provider "aws" {
  region = "us-east-1" # região da instância
  profile = "terraform-user-test22" # nome colocado no profile após o aws configure, access key id e secret access key
}