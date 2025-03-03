resource "google_compute_instance" "vm_instance" {
  name         = var.vm_name
  machine_type = var.machine_type
  zone         = var.zone

  boot_disk {
    initialize_params {
      image = var.image
    }
  }

  network_interface {
    network = "default"
    access_config {
      # Assigns a public IP
    }
  }

  tags = ["web"]

#   metadata_startup_script = <<-EOT
#     #!/bin/bash
#     sudo apt update -y
    
#     # Install Apache
#     sudo apt install -y apache2
#     sudo systemctl start apache2
#     sudo systemctl enable apache2
    
#     # Install Ansible
#     sudo apt install -y software-properties-common
#     sudo add-apt-repository --yes --update ppa:ansible/ansible
#     sudo apt install -y ansible
    
#     # Verify Installation
#     ansible --version
#   EOT
}
