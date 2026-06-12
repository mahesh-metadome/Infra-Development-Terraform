# Static external IP
resource "google_compute_global_address" "default" {
  name = "${var.lb_name}-ip"
}

# Health check
resource "google_compute_health_check" "default" {
  name               = "${var.lb_name}-health-check"
  check_interval_sec = 10
  timeout_sec        = 5


  http_health_check {
    port = var.backend_port
  }
}

# Instance group (backend)
resource "google_compute_instance_group" "default" {
  name = "${var.lb_name}-instance-group"
  zone = "${var.region}-a"
}

# Backend service
resource "google_compute_backend_service" "default" {
  name                  = "${var.lb_name}-backend"
  protocol              = "HTTP"
  port_name             = "http"
  load_balancing_scheme = "EXTERNAL"
  health_checks         = [google_compute_health_check.default.id]

  backend {
    group = google_compute_instance_group.default.id
  }
}

# URL map
resource "google_compute_url_map" "default" {
  name            = "${var.lb_name}-url-map"
  default_service = google_compute_backend_service.default.id
}

# HTTP target proxy
resource "google_compute_target_http_proxy" "default" {
  name    = "${var.lb_name}-http-proxy"
  url_map = google_compute_url_map.default.id
}

# Forwarding rule (frontend)
resource "google_compute_global_forwarding_rule" "default" {
  name                  = "${var.lb_name}-forwarding-rule"
  load_balancing_scheme = "EXTERNAL"
  ip_address            = google_compute_global_address.default.id
  ip_protocol           = "TCP"
  port_range            = "80"
  target                = google_compute_target_http_proxy.default.id
}