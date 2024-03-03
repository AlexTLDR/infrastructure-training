provider "google" {
  region      = var.region
  zone        = var.zone
  project     = var.project
  credentials = var.certificate["key"]
}

resource "google_compute_instance" "default" {
  name         = "terraform-instance"
  machine_type = var.machine_type
  tags         = ["ssh"]

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-10"
    }
  }

  # install nginx
  metadata_startup_script = "sudo apt-get update && sudo apt-get install -y nginx && sudo service nginx start"

  network_interface {
    network = "default"
    access_config {
      # nat_ip = ""
    }
  }
}

resource "google_compute_firewall" "http_firewall" {
  name    = "default-allow-http"
  network = "default"

  allow {
    protocol = "tcp"
    ports    = ["80"]
  }

  source_ranges = ["0.0.0.0/0"]
}

# bucket needs to be created before running terraform init
# gsutil mb -p terraform-learn-416018 -c standard -l europe-west10 gs://terraform-learn-416018
# this is a known limitation of terraform
terraform {
  backend "gcs" {
    bucket = "terraform-learn-416018"
    prefix = "terraform/state"

  }
}

