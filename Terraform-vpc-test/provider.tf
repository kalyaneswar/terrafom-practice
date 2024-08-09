terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.56.1"
    }
  }


 backend "s3"{
    bucket = "kalyaneswar-remote-state"
    # Key need to change
    key = "expense-vpc"
    region = "us-east-1"
    dynamodb_table = "kalyaneswar-locking"
 }
}

provider "aws" {
    region     = "us-east-1"
}
