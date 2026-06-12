resource "google_storage_bucket" "main" {
  name     = "mahesh-demo-bucket-12345"
  location = "ASIA-SOUTH1"

  storage_class = "STANDARD"

  uniform_bucket_level_access = true

  force_destroy = true

  versioning {
    enabled = true
  }

  labels = {
    terraform = "true"
  }
}
