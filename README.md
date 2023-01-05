A pod is a unit of replication on a cluster; A cluster can contain many pods, related or unrelated [and] grouped under the tight logical borders called namespaces.

Ingress exposes HTTP and HTTPS routes from outside the cluster to services within the cluster

A ReplicaSet's purpose is to maintain a stable set of replica Pods running at any given time. As such, it is often used to guarantee the availability of a specified number of identical Pods.

Kubectl is the kubernetes command line tool to communication and control clutsers

Docker is a platform that can package an application and its dependencies in an isolated environment that can be used on any server

Traefik is an HTTP reverse proxy and load balancer that make deploying microservices easy. It is a dedicated layer to handle communication between services

k3s is a very efficient and lightweight fully compliant Kubernetes distribution.
k3d is a utility designed to easily run k3s in Docker, it provides a simple CLI to create, run, delete a fully compliance Kubernetes cluster with 1 to n nodes.
https://www.sokube.ch/post/k3s-k3d-k8s-a-new-perfect-match-for-dev-and-test

Useful commands:
    - $ kubectl get pod -n argocd
    - $ kubectl get svc -n argocd