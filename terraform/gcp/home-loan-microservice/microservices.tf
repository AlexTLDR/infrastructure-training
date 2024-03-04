variable "gke_cluster_name" {
    type = string
}

variable "application_name" {
    type = string
}

variable "gke_num_nodes" {
    type = number
    description = "number of gke nodes"
}

variable "machine_type" {
    type = string
    description = "machine type for gke nodes"
}

resource "google_container_cluster" "primary" {
    name = "${var.gke_cluster_name}-${var.application_name}-${var.environment}"
    # location = var.region
    location = var.zone
    remove_default_node_pool = true
    initial_node_count = 1

    network = google_compute_network.vpc.self_link
    subnetwork = google_compute_subnetwork.subnet.self_link
}

resource "google_container_node_pool" "primary_nodes" {
    name = "${google_container_cluster.primary.name}-node-pool"
    # location = var.region
    location = var.zone
    cluster = google_container_cluster.primary.name
    node_count = var.gke_num_nodes

    node_config {
      oauth_scopes = [
        "https://www.googleapis.com/auth/logging.write",
        "https://www.googleapis.com/auth/monitoring",
      ]

      machine_type = var.machine_type
      metadata = {
        disable-legacy-endpoints = "true"
      }
    }
}