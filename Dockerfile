FROM harness/delegate:latest  # Use official Harness delegate image

# Install Ansible
RUN apt-get update && apt-get install -y ansible sshpass python3-pip && \
    pip3 install --upgrade pip

# Verify installation
RUN ansible --version

# Set working directory
WORKDIR /opt/harness-delegate

# Start the delegate
ENTRYPOINT ["/entrypoint.sh"]
