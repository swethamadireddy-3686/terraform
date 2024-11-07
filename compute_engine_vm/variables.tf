variable "project" {
  description = "Name/ID of Project where VM needs to be deployed"
  default = "carrier-lzmaster"
}

variable "name" {
    description = "List of Names of Compute Engines to be deployed, ensure list have same entries as countofinstances"
  default = ["sandbox-env1","sandbox-env2"]
}

variable "countofinstances" {
  description = "No. of VM instances to be created, Need to ensure that count matches to list of names in above variable"
  default = 2
}

variable "region" {
  description = "Google Regions where resource needs to be deployed"
  default = "us-east1"
}

variable "zone" {
  description = "GCP zone in the above specified region where resource needs to be deployed."
  default = "us-east1-b"
}

variable "machine_type" {
  description = "Machine type for VM's to be defined for size of compute and memory"
  default = "f1-micro"
}


variable "image" {
  description = "OS disk image for the VM's, these could be default provided by GCP or self created Images"
  default = "debian-cloud/debian-9"
}

variable "startupscript" {
  description = "Metadata start up script to be executed post VM is launched."
  default = "sudo apt-get update; sudo apt-get install -yq build-essential python-pip rsync; pip install flask"
}

variable "network" {
  description = "Network in which resource needs to be deployed."
  default = "vpc-nonprod"
}

variable "subnetwork" {
  description = "Subnetwork for VPC"
  default = "subnet-nonprod-env1"
  
}