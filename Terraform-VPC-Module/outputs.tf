output "vpc_id" {
  description = "Self-link of the VPC network"
  value       = google_compute_network.main.id
}

output "vpc_name" {
  description = "Name of the VPC network"
  value       = google_compute_network.main.name
}

output "subnet_ids" {
  description = "Map of subnet short-name to subnet self-link"
  value       = { for k, s in google_compute_subnetwork.main : k => s.id }
}

output "subnet_cidrs" {
  description = "Map of subnet short-name to CIDR block"
  value       = { for k, s in google_compute_subnetwork.main : k => s.ip_cidr_range }
}
