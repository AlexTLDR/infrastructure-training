resource "google_compute_instance" "vm_module" {
    name = var.ce_name
    machine_type = var.machine_type
    zone = var.zone
    boot_disk {
        initialize_params {
            image = var.image
        }
    }
    network_interface {
        network = "default"
        access_config {
            // Ephemeral IP
        }
    }
}