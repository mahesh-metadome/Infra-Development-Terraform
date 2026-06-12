output "bucket_names" {
  description = "Map of bucket short-name to GCS bucket name"
  value       = { for k, b in google_storage_bucket.main : k => b.name }
}

output "bucket_urls" {
  description = "Map of bucket short-name to GCS bucket self-link URL"
  value       = { for k, b in google_storage_bucket.main : k => b.url }
}

output "bucket_self_links" {
  description = "Map of bucket short-name to bucket self-link"
  value       = { for k, b in google_storage_bucket.main : k => b.self_link }
}
