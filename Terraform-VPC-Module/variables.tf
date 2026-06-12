variable "vpc_name" {
  description = "Base name of the VPC (will be prefixed with environment)"
  type        = string
  default = "test-vpc"
}


variable "subnets" {
  description = "Map of subnets to create"

  type = map(object({
    cidr                  = string
    region                = string
    private_google_access = optional(bool, true)
  }))

  default = {
    mumbai = {
      cidr                  = "10.0.1.0/16"
      region                = "asia-south1"
      
    }
  }
}
variable "region" {
  description = "Default region for resources"
  type        = string
  default     = "asia-south1"
}

variable "project_id" {
  description = "GCP project ID"
  type        = string
  default     = "billing-test-9b"
}