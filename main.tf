provider "google" {
    project = "project-d89e9adb-fdf0-493c-ad4"
    region = "us-central1"
  
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