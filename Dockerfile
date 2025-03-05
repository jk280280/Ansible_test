FROM harness/delegate:latest

# Install Ansible
RUN apt-get update && apt-get install -y ansible sshpass python3-pip git && \
    pip3 install --upgrade pip

# Verify installation
RUN ansible --version && git --version

# Set working directory
WORKDIR /opt/harness-delegate

# Start the delegate
ENTRYPOINT ["/entrypoint.sh"]
