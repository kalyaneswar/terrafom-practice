terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.56.1"
    }
  }
}

provider "aws" {
  # Configuration options
    region     = "us-east-1"
    # U can provide key here as well but it will breach security
    # access_key = "my-access-key"
    # secret_key = "my-secret-key"

}

