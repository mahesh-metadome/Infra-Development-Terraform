output "load_balancer_ip" {
  value       = google_compute_global_address.default.address
  description = "External IP of the load balancer"
}

output "backend_service" {
  value = google_compute_backend_service.default.name
}