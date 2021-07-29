terraform {
  required_version = ">= 0.14"

  required_providers {
    google = {
      version = ">= 3.76"
    }
  }
}

provider "google" {
  project = "project-systems-engineering"
  region  = "us-central1"
}
