terraform {
  required_version = "> 0.14.0"
  required_providers {
    google = {
      source = "hashicorp/google"
    }
  }
  experiments = [module_variable_optional_attrs]
}

