#!/bin/bash

k3d cluster create iot-cluster --api-port 6443 -p 8080:80@loadbalancer --agents 2 --wait

kubectl create namespace argocd
kubectl create namespace dev

kubectl apply -n argocd -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml
# This command will complete quickly, but pods will still be spinning up on the back end.
# These need to be in a running state before you can move forward. Use the watch command
# to ensure the pods are running and ready.
# watch kubectl get pods -n argocd

kubectl wait --for=condition=Ready pods --all -n argocd

# By default ArgoCD uses the server pod name as the default password for the admin user,
# To get server pod name => kubectl get pods -n argocd -l app.kubernetes.io/name=argocd-server -o name | cut -d'/' -f 2
# so we're gonna replace it with 123 (we used https://bcrypt-generator.com/
# to generate the blowfish hash version of "123" below)

kubectl -n argocd patch secret argocd-secret \
  -p '{"stringData": {
    "admin.password": "$2a$12$xyk8mlgC6l6gWQhTA.LF8uqlX5ng6Ju5BU7zhJ4Sp4VuCzQT7szIm",
    "admin.passwordMtime": "'$(date +%FT%T%Z)'"
  }}'

kubectl apply -f ../confs/project.yaml -n argocd

kubectl apply -f ../confs/application.yaml -n argocd

kubectl wait --for=condition=Ready pods --all -n argocd

echo "Forward argocd with      : kubectl port-forward --address 0.0.0.0 svc/argocd-server -n argocd 8888:443"
echo "Forward application with : kubectl port-forward svc/wil-playground -n dev 2222:8888"
echo "You can reach the app with $ curl 127.0.0.1:2222"

echo "Username: admin"
echo "Password: 123"
echo "Script end"