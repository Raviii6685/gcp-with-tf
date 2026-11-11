terraform {
  required_version = ">= 1.6"

  required_providers {
    google = {
      source  = "hashicorp/google"
      version = ">= 6.0"
    }
  }

  # Enabled later, after the bucket exists (state migration step)
  # backend "gcs" {
  #   bucket = "prj-tf-seed-<suffix>-tfstate"
  #   prefix = "00-bootstrap"
  # }
}