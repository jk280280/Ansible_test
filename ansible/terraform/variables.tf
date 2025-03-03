variable "project_id" {
  description = "GCP Project ID"
  type        = string
}

variable "region" {
  description = "GCP Region"
  type        = string
  default     = "us-central1"
}

variable "zone" {
  description = "GCP Zone"
  type        = string
  default     = "us-central1-a"
}

variable "vm_name" {
  description = "Name of the Virtual Machine"
  type        = string
  default     = "my-gcp-vm"
}

variable "machine_type" {
  description = "VM instance type"
  type        = string
  default     = "e2-medium"
}

variable "image" {
  description = "OS image for the VM"
  type        = string
  default     = "debian-cloud/debian-11"
}
