# Install k3s controller mode
curl -sfL https://get.k3s.io | K3S_KUBECONFIG_MODE="644" INSTALL_K3S_EXEC="--flannel-iface eth1" sh -s -

/usr/local/bin/kubectl create configmap app1-html --from-file /vagrant/confs/k3s/app1/index.html
/usr/local/bin/kubectl apply -f /vagrant/confs/k3s/apps/app1.yaml


/usr/local/bin/kubectl create configmap app2-html --from-file /vagrant/confs/k3s/app2/index.html
/usr/local/bin/kubectl apply -f /vagrant/confs/k3s/app2/app2.yaml


/usr/local/bin/kubectl create configmap app3-html --from-file /vagrant/confs/k3s/app3/index.html
/usr/local/bin/kubectl apply -f /vagrant/confs/k3s/app3/app3.yaml
