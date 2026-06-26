

terraform {
 required_providers {
   google = {
     source = "hashicorp/google"
     version = "~> 7.6"
   }
 }
}
provider "google" {
    project = "project-d89e9adb-fdf0-493c-ad4"
    region = "us-central1"
  
}

# Create a new storage bucket
resource "google_storage_bucket" "static" {
 name = "ajay26-storage-bucket"
 location = "US"
 storage_class = "STANDARD"
 uniform_bucket_level_access = true
}
# Upload an object to the bucket
resource "google_storage_bucket_object" "default" {
 name = "sample_file.txt"
 source = "${path.module}/sample_file.txt"
 content_type = "text/plain"
 bucket = google_storage_bucket.static.id
}
resource "google_compute_instance" "ajay" {
 name = "terraform-instance"
 machine_type = "f1-micro"
 zone = "us-central1-a"
 boot_disk {
   initialize_params {
     image = "debian-cloud/debian-11"
   }
 }
 network_interface {
   network = "default"
   access_config {}
 }
}