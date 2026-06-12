resource "google_storage_bucket" "main" {
  name     = var.bucket_name
  location = var.location

  storage_class = var.storage_class

  uniform_bucket_level_access = var.uniform_bucket_level_access

  force_destroy = var.force_destroy

  versioning {
    enabled = var.versioning_enabled
  }

  labels = var.labels
}
