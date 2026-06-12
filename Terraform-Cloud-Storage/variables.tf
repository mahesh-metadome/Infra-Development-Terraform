variable "environment" {
  description = "Deployment environment — used as a prefix for all resource names"
  type        = string

  validation {
    condition     = contains(["dev", "staging", "prod"], var.environment)
    error_message = "environment must be one of: dev, staging, prod."
  }
}

variable "project_id" {
  description = "GCP project ID where buckets will be created"
  type        = string
}

variable "location" {
  description = "GCS bucket location — single-region (e.g. US-CENTRAL1), dual-region, or multi-region (e.g. US)"
  type        = string
  default     = "US"
}

variable "buckets" {
  description = "Map of buckets to create. Key is the bucket short-name."
  type = map(object({
    storage_class               = optional(string, "STANDARD")
    force_destroy               = optional(bool, false)
    versioning_enabled          = optional(bool, true)
    uniform_bucket_level_access = optional(bool, true)
    public_access_prevention    = optional(string, "enforced")

    lifecycle_rules = optional(list(object({
      action_type          = string
      condition_age_days   = optional(number)
      condition_with_state = optional(string, "ANY")
    })), [])

    cors = optional(list(object({
      origins          = list(string)
      methods          = list(string)
      response_headers = optional(list(string), [])
      max_age_seconds  = optional(number, 3600)
    })), [])
  }))
}
