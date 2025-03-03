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

  metadata_startup_script = <<EOT
    #!/bin/bash
    apt update -y
    apt install -y apache2
    systemctl start apache2
    systemctl enable apache2
  EOT
}
