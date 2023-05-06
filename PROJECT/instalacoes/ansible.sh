#!/bin/bash

# Install Terraform
wget https://releases.hashicorp.com/terraform/1.4.4/terraform_1.4.4_linux_amd64.zip
unzip terraform_1.4.4_linux_amd64.zip
sudo mv terraform /usr/local/bin/

# Install Ansible
sudo apt update
sudo apt install -y ansible

# Create new user and add to sudo group
sudo usermod -aG sudo ubuntu
