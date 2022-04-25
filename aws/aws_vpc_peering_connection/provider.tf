terraform {
  required_version = "> 0.14"
  required_providers {
    aws = {
      source = "hashicorp/aws"
    }
  }
}

#provider "aws" {
#  alias = "this"
#}

#provider "aws" {
#  alias  = "peer"
#  region = var.peer_region
#}

