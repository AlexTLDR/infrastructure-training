region             = "europe-west10"
zone               = "europe-west10-a"
project_id         = "terraform-learn-416018"
environment        = "staging"
ip-cidr-range-west = "10.10.0.0/28"

# microservices
gke_cluster_name ="gke-staging"
application_name= "home-loan-staging"
gke_num_nodes= 1
machine_type = "e2-micro"