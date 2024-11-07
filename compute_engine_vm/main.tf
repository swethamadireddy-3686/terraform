// Configure the Google Cloud provider
provider "google" {
 credentials = file("C:\\Terraform\\credentialcarriermaster.json")
 project     = var.project
 region      = var.region
}
provider "google-beta" {

credentials = "${file("C:\\Terraform\\credentialcarriermaster.json")}"
}
// A single Compute Engine instance
resource "google_compute_instance" "default"{
 count = var.countofinstances 
 name = element(var.name, count.index)
 machine_type = var.machine_type
 zone         = var.zone
 labels = {"carriervm" : "billing1"}
 boot_disk {
   initialize_params {
     image = var.image
   }
 }

// Make sure flask is installed on all new instances for later steps
 metadata_startup_script = var.startupscript

 network_interface {
   network = var.network
   subnetwork = var.subnetwork

   access_config {
     // Include this section to give the VM an external ip address
   }
 }
}