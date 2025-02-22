#!/bin/bash

set -e

# Check if the system is Ubuntu Server
if [[ "$(lsb_release -is)" != "Ubuntu" ]]; then
    echo "Error: This script is only intended for Ubuntu Server. Exiting."
    exit 1
fi

echo "Updating package list and installing dependencies..."
sudo apt update && sudo apt install -y ansible curl

echo "Running Ansible playbook..."
ansible-playbook -i "localhost," -c local ansible/playbook.yml

echo "Setup complete!"
