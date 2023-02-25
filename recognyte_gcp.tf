provider "google" {
  credentials = file("<path-to-gcp-credentials-file>")
  project     = "<project-id>"
  region      = "us-central1"
  zone        = "us-central1-c"
}

resource "google_storage_bucket" "example_bucket" {
  name     = "example-bucket"
  location = "us-central1"
}

resource "google_container_cluster" "example_cluster" {
  name     = "example-cluster"
  location = "us-central1"

  node_pool {
    name       = "example-pool"
    node_count = 1
    config {
      machine_type = "n1-standard-1"
      preemptible = true
    }
  }
}