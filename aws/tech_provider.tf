terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "3.38.0"
    }
  }
}
provider "aws" {
  region                  = "${var.provider_region}"
  shared_credentials_file = "${var.provider_credentials}"
  profile                 = "${var.provider_profile}"
}