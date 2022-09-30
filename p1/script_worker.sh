#!/bin/bash
curl -sSL https://get.k3s.io | sh
mkdir /vagrant/kuberconfig
sudo cp /etc/rancher/k3s/k3s.yaml /vagrant/kuberconfig
k3s agent
# sed -i "s/127\.0\.0\.1/192.168.33.10/" /vagrant/kuberconfig
