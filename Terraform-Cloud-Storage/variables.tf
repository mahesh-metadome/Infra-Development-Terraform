variable "bucket_name" {
  description = "Globally unique name for the GCS bucket"
  type        = string
  default = "Test-bucket"
}

variable "location" {
  description = "GCS bucket location — single-region (e.g. ASIA-SOUTH1), dual-region, or multi-region (e.g. US)"
  type        = string
  default     = "ASIA-SOUTH1"
}

variable "storage_class" {
  description = "Storage class for the bucket — STANDARD, NEARLINE, COLDLINE, or ARCHIVE"
  type        = string
  default     = "STANDARD"
}

variable "uniform_bucket_level_access" {
  description = "Enables uniform bucket-level IAM access; disables ACLs"
  type        = bool
  default     = true
}

variable "force_destroy" {
  description = "Allow Terraform to destroy the bucket even if it contains objects"
  type        = bool
  default     = false
}

variable "versioning_enabled" {
  description = "Enable object versioning on the bucket"
  type        = bool
  default     = true
}

variable "labels" {
  description = "Labels to apply to the bucket"
  type        = map(string)
  default = {
    terraform = "true"
  }
}
