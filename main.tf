terraform {
  required_version = "> 0.12.0"
}

provider "aws" {
  version = "~> 2.52"
  region  = "eu-west-2"

  assume_role {
     role_arn = "arn:aws:iam::899987639597:role/cross-account-pttp"
  }
}

provider "random" {
  version = "~> 2.2.1"
}

resource "random_string" "random" {
  length = 10
  upper = false
  special = false
}

resource "aws_s3_bucket" "poc" {
  bucket = "pttp-showcase-${random_string.random.result}"
  acl    = "private"
}
