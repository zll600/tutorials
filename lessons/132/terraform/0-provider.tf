locals {
  project_id = "devops-367201" # TODO: replace project id
}

provider "google" {
  project = local.project_id
  region  = "us-central1"
}

# Only needed to enable managed prometheus
provider "google-beta" {
  project = local.project_id
  region  = "us-central1"
}

terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 6.0"
    }
    google-beta = {
      source  = "hashicorp/google-beta"
      version = "~> 6.0"
    }
  }

  required_version = "> 1.0.0"
}
