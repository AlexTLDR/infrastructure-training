region                     = "europe-west3"
zone                       = "europe-west3-c"
project_project_id         = "terraform-learn-416018"
environment                = "prod"
default-ip-cidr-range-west = "10.10.0.0/28"

# microservices
gke_cluster_name ="gke-prod"
application_name= "home-loan-prod"
gke_num_nodes= 1
machine_type = "e2-micro"

# redis
tier = "BASIC"
memory_storage_name = "redis-prod"