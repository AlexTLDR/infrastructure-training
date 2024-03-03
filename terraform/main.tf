provider "google" {
  region      = var.region
  zone        = var.zone
  project     = var.project
  credentials = var.certificate["key"]
}

locals {
  version = 1 # because of label contraints, I am using number as version and tostring() to convert it to string for label
  prefix  = "terraform-learn"
}

resource "google_compute_instance" "nginx" {
  name         = "${local.prefix}-nginx"
  machine_type = var.machine_type
  tags         = ["http-server", "https-server"]

  labels = {
    application_name = "nginx"
    environment      = var.environment
    version          = tostring(local.version)
  }

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-12"
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

resource "google_compute_instance" "jumpbox"{
  name = "${local.prefix}-jumpbox"
  machine_type = var.machine_type
  tags = ["ssh"]

  labels = {
    application_name = "jumpbox"
    environment = var.environment
    version = local.version
  }

  boot_disk {
    initialize_params {
      image = "ubuntu-os-cloud/ubuntu-2004-lts"
    }
  }

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

