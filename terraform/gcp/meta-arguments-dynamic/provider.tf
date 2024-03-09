terraform {
  required_providers {
    google = {
      source = "hashicorp/google"
    }
  }
}

provider "google" {
  credentials = "gcp-key/terraform-learn-416018-44117c9f0404.json"
  region      = "europe-west10"
  zone        = "europe-west10-a"
  project     = var.project
}