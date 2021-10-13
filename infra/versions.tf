terraform {
  required_version = ">= 0.13.4"

  required_providers {
    aws = ">= 3.15.0"
  }

  backend "s3" {
    bucket         = "backend-terraform-lahaus"
    key            = "test/development/terraform.tfstate"
    region         = "us-west-2"
    dynamodb_table = "bakend-terraform-lahaus"

  }


}