terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }

  backend "s3" {

    bucket = "myawsbucketdavego"
    key = "itmLab/test.tfstate"
    encrypt = true
    region = "us-east-1"
    shared_credentials_files = [ "C:/Users/anderson.velasquez/.aws/credentials" ]
    profile = "default"
    dynamodb_table = "tfstate_rne"
    
  }

  
}

# AWS Provider
provider "aws" {
  #shared_config_files      = ["C:/Users/anderson.velasquez/.aws/config"]
  #shared_credentials_files = ["C:/Users/anderson.velasquez/.aws/credentials"]
  profile                  = "default"
  region                   = "us-east-1"
}
