output "bucket_name" {
  description = "Name of the GCS bucket"
  value       = google_storage_bucket.main.name
}

output "bucket_url" {
  description = "Base URL of the GCS bucket (gs://...)"
  value       = google_storage_bucket.main.url
}

output "bucket_self_link" {
  description = "URI of the GCS bucket for use in IAM bindings"
  value       = google_storage_bucket.main.self_link
}

output "bucket_location" {
  description = "Location where the bucket is created"
  value       = google_storage_bucket.main.location
}

output "storage_class" {
  description = "Storage class of the bucket"
  value       = google_storage_bucket.main.storage_class
}
