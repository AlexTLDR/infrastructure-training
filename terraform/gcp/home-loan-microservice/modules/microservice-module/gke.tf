resource "google_container_cluster" "primary" {
    name = var.gke_cluster_name
    # location = var.region # for learning purposes, we will use zone. This creates only one node pool instead of 3
    location = var.zone
    remove_default_node_pool = true
    initial_node_count = 1
    default_max_pods_per_node = var.pods_per_nodes
    enable_shielded_nodes = true
    deletion_protection = "false"
    network = var.vpc
    subnetwork = var.subnet
}

resource "google_container_node_pool" "primary_nodes" {
    name = var.google_container_node_pool_name
    # location = var.region # for learning purposes, we will use zone. This creates only one node pool instead of 3
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