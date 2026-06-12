variable "vpc_name" {
  description = "Base name of the VPC (will be prefixed with environment)"
  type        = string
  default = "test-vpc"
}


variable "subnets" {
  description = "Map of subnets to create. Key is the subnet short-name (e.g. 'mumbai')."
  type = map(object({
    cidr                  = string
    region                = string
    private_google_access = optional(bool, true)
  }))
}

variable "region" {
  description = "Default region for resources"
  type        = string
  default     = "us-central1"
}

variable "project_id" {
  description = "GCP project ID"
  type        = string
  default     = "billing-test-9b"
}