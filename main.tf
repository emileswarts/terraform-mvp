terraform {
  required_version = "> 0.12.0"
}

provider "aws" {
  version = "~> 2.52"
  region  = "eu-west-2"
}

provider "aws" {
  alias = "production"
  version = "~> 2.52"
  region  = "eu-west-2"

  assume_role {
    role_arn = "arn:aws:iam::068084030754:role/SharedServicesCodeBuild"
  }
}

module "s3" {
  source    = "./modules/s3"
  providers = {
    aws = "aws.production"
  }
}
