resource "google_compute_network" "main" {
  name                    = var.vpc_name
  auto_create_subnetworks = false
  routing_mode            = "GLOBAL"
}

resource "google_compute_subnetwork" "main" {
  for_each = var.subnets

  name                     = "${each.key}-subnet"
  ip_cidr_range            = each.value.cidr
  region                   = each.value.region
  network                  = google_compute_network.main.id
  private_ip_google_access = each.value.private_google_access
}

resource "google_compute_firewall" "allow_all" {
  name    = "allow-all"
  network = google_compute_network.main.name

  allow {
    protocol = "all"
  }

  source_ranges = ["0.0.0.0/0"]
}