terraform {
  required_providers {
    google = {
      source = "hashicorp/google"
    }
  }
}

provider "google" {
  credentials = var.certificate["key"]
  region      = var.region
  zone        = var.zone
  project     = var.project_id
}