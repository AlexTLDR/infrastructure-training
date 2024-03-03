variable "certificate" {
  type    = map(string)
  default = {}
}

provider "google" {
  region      = "europe-west10"
  zone        = "europe-west10-a"
  project     = "terraform-learn-416018"
  credentials = var.certificate["key"]
}

resource "google_compute_instance" "default" {
  name         = "terraform-instance"
  machine_type = "e2-micro"
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

terraform {
  backend "gcs" {
    bucket = "terraform-learn-416018"
    prefix = "terraform/state"
    
  }
}