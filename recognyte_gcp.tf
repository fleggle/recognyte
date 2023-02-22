# Configure the Google Cloud provider
provider "google" {
  credentials = file("<path-to-your-gcp-credentials-file>")
  project     = "<your-project-id>"
  region      = "us-central1"
  zone        = "us-central1-c"
}

# Create the storage bucket
resource "google_storage_bucket" "example_bucket" {
  name     = "example-bucket"
  location = "us-central1"
}

# Create the Kubernetes cluster
resource "google_container_cluster" "example_cluster" {
  name     = "example-cluster"
  location = "us-central1"

  # Set the node pool to have one preemptible node with n1-standard-1 machine type
  node_pool {
    name       = "example-pool"
    node_count = 1
    config {
      machine_type = "n1-standard-1"
      preemptible = true
    }
  }
}