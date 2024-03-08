locals {
   sets = toset(["ce1", "ce2", "ce3"])
    maps = {
        ce1-map = {vm_size = "e2-micro", zone = "europe-west3-a"},
        ce2-map = {vm_size = "e2-small", zone = "europe-west3-b"},
        ce3-map = {vm_size = "e2-medium", zone = "europe-west3-c"},
    }
}

resource "google_compute_instance" "map" {
    # for_each = local.maps
    for_each = var.maps
    name = each.key
    machine_type = each.value.vm_size
    zone = each.value.zone
    boot_disk {
        initialize_params {
            image = "debian-cloud/debian-12"
        }
    }
    network_interface {
        network = "default"
        access_config {
            // Ephemeral IP
        }
    }
}

resource "google_compute_instance" "set" {
    # for_each = toset(["ce1", "ce2", "ce3"])
    for_each = toset(var.sets)
    name = each.key
    machine_type = "e2-micro"
    zone = "europe-west3-a"
    boot_disk {
        initialize_params {
            image = "debian-cloud/debian-12"
        }
    }
    network_interface {
        network = "default"
        access_config {
            // Ephemeral IP
        }
    }
}