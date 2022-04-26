terraform {
  required_version = "> 0.14.0"
  required_providers {
    aws = {
      source = "hashicorp/aws"
    }
  }
  experiments = [module_variable_optional_attrs]
}

