module "microservice_production" {
  # source = "github.com/AlexTLDR/infrastructure-training/terraform/gcp/home-loan-microservice/modules/microservice-module?ref=v0.0.1"
  source = "git::https://github.com/AlexTLDR/infrastructure-training.git//terraform/gcp/home-loan-microservice/modules/microservice-module?ref=v0.0.2"

  gke_cluster_name = "gke-home-loan-production"
  region           = var.region
  pods_per_nodes   = 25
  vpc              = google_compute_network.vpc.self_link
  subnet           = google_compute_subnetwork.subnet.self_link

  google_container_node_pool_name = "gke-home-loan-node-pool-production"
  gke_num_nodes                   = 1
  machine_type                    = "e2-micro"

  memory_storage_name = "memory-store-home-loan-production"
  memory_size_gb      = 1
  tier                = "BASIC"
  project_id          = var.project_id

  application_name = "cs-home-loan-production"
  versioning       = false
} 