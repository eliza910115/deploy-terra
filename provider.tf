terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
  # State-data-file storage: type and path. S3 bucket and DynamoDB table must be exist on AWS Account
  backend "s3" {
    bucket                      = "terraform-tfstates-deploy"
    key                         = "rne/rne.tfstate"
    encrypt                     = true
    region                      = "us-east-1"
    # shared_credentials_files    = ["C:/Users/elizabet.blandon/.aws/credentials"]
    # profile                     = "default"
    dynamodb_table              = "tfstate_deploy"
  }
}
 
# AWS Provider
provider "aws" {
  # shared_config_files      = ["C:/Users/elizabet.blandon/.aws/config"]
  # shared_credentials_files = ["C:/Users/elizabet.blandon/.aws/credentials"]
 # profile                  = "default"
  region                   = "us-east-1"
}