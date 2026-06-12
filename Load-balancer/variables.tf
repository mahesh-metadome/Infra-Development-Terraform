variable "project_id" {
  type    = string
  default = "billing-test-9b"
}

variable "region" {
  type    = string
  default = "us-central1"
}

variable "lb_name" {
  type    = string
  default = "external-alb"
}

variable "backend_port" {
  type    = number
  default = 80
}