resource "kubernetes_service" "nginx" {
  metadata {
      name = "${var.app_name}"
  }
  spec {
      selector {
          App = "${kubernetes_pod.nginx.metadata.0.labels.App}"
      }
      port {
          port = 80
          target_port = 80
      }
      type = "ClusterIP"
  }
}
