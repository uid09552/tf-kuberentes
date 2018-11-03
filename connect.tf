provider "kubernetes" {
    host = "https://192.168.99.101:8443"
    client_certificate = "${file("~/.kube/client-cert.pem")}"
    client_key = "${file("~/.kube/client-key.pem")}"
    cluster_ca_certificate = "${file("~/.kube/cluster-ca-cert.pem")}"
    username = "vagrant-multi-admin"
}
