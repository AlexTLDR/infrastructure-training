resource "google_compute_firewall" "rules" {
  project       = var.project
  name          = "terraform-rule"
  network       = "default"
  description   = "Creates firewall rules"
  source_ranges = ["0.0.0.0/0"]

 dynamic "allow" {
    for_each = var.allow_list
    content{
        protocol = allow.value.protocol
        ports = allow.value.ports
    }
 }

}