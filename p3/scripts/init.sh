#!/bin/bash

sudo yum update -y
sudo yum upgrade -y

## Installing curl

sudo yum install curl -y

## Installing Docker

curl -fsSL https://get.docker.com -o get-docker.sh
sudo sh ./get-docker.sh
sudo systemctl start docker
sudo groupadd docker
sudo usermod -aG docker $(whoami)
sudo chmod 777 /var/run/docker.sock

## Installing Kubectl

curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
curl -LO "https://dl.k8s.io/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl.sha256"
echo "$(<kubectl.sha256) kubectl" | sha256sum --check
sudo install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl
chmod +x kubectl
sudo mv ./kubectl /usr/local/bin

## K3d

curl -s https://raw.githubusercontent.com/rancher/k3d/main/install.sh | bash
sudo chmod +x /usr/local/bin/k3d
echo "Installing the auto-completion scripts for k3d"
echo "source <(k3d completion bash)" >> ~/.bashrc

echo "Script end"