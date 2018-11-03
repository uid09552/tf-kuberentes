# Getting Started
1. Install Minikube
2. Install kubectl
3. Install VirtualBox
4. Install Terraform CLI

## Start Cluster
1. `minikube start` --> start kuberentes cluster within VirtualBox
2.  `kubectl cluster-info`  --> get node url
3. Copy the cluster keys (ca, private, cert) to a folder where terraform can use it
4. configure the provider accordendly

## Init Usage
1. `terraform init` --> check connection
2. `kubectl get namespace` --> copy to variables.tfvars or app.tf
3. `terraform apply` --> will deploy with terraform
4. `kubectl get pods`
5. `kubectl get services`
7. `kubectl proxy`
8. `watch -n 1 curl http://localhost:8001/api/v1/namespaces/default/pods/nginx-example/proxy/`
9. `terraform destroy`

## HA Setup
1. `configure main.tf to use RPController
