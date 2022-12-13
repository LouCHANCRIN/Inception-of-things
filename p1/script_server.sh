#!/bin/bash
echo "**** Begin installing k3s"
curl -sfL https://get.k3s.io | INSTALL_K3S_VERSION=v1.19.5+k3s1 K3S_KUBECONFIG_MODE="644" sh -
# curl -sfL https://get.k3s.io | INSTALL_K3S_CHANNEL=latest sh -
echo "**** End installing k3s"
mkdir /home/vagrant/kuberconfig
cat /etc/rancher/k3s/k3s.yaml
sudo cp /etc/rancher/k3s/k3s.yaml /home/vagrant/kuberconfig
# chmod +x k3s
# sudo mv k3s /usr/local/bin
# k3s server
# sed -i "s/127\.0\.0\.1/192.168.33.10/" /vagrant/kuberconfig
