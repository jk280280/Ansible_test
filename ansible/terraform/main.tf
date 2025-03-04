provider "google" {
  project     = "harness-project-450807"
  region      = "us-central1"
}

resource "google_compute_instance" "harness_delegate" {
  name         = "harness-delegate-vm"
  machine_type = "e2-medium"
  zone         = "us-central1-a"

  boot_disk {
    initialize_params {
      image = "ubuntu-2004-focal-v20231010"
    }
  }

  network_interface {
    network = "default"
    access_config {}  # Enable public IP
  }

  metadata_startup_script = <<-EOF
    #!/bin/bash
    apt-get update -y
    apt-get install -y docker.io
    systemctl start docker
    systemctl enable docker
    docker run -d --name harness-delegate \
      -e ACCOUNT_ID=ucHySz2jQKKWQweZdXyCog \
      -e DELEGATE_TOKEN=NzY5NTY3ZjJkYTczNWNjZDJjMmIwN2Y4MTA4NTJkNzM= \
      -e MANAGER_HOST_AND_PORT=https://app.harness.io \
      harithahari2420/custom-harness-delegate
  EOF
}
