resource "kubernetes_pod" "nginx" {
  metadata {
      name ="${var.app_name}"
      labels {
          App = "nginx"
      }
      annotations = {
          name = "nginx"
          type ="public-image"
      }
      namespace = "default"
  }
  spec {
      container {
          image = "nginx:1.7.8"
            name = "example"
      port {
          container_port = 80
      }
      }
  }
}
variable "app_name" {
    default = "nginx-example"
}
