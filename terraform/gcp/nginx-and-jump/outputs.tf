output "instance_id" {
  value = google_compute_instance.nginx.instance_id
}

output "cpu_platform" {
  value = google_compute_instance.nginx.cpu_platform
}