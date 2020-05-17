terraform {
  required_version = "> 0.12.0"
}

provider "aws" {
  version = "~> 2.52"
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
