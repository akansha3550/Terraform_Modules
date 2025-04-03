provider "aws" {
  region = var.aws_region
}

terraform {
  backend "s3" {
    bucket = "deletelaters3backend"
    key    = "Development.tfstate"
    region = "us-east-1"
  }
}
