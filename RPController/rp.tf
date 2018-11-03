resource "kubernetes_replication_controller" "goexample" {
  metadata {
    name = "goexample"
    labels {
      App = "goexample"
    }
  }

  spec {
    replicas = 2
    selector {
      App = "goexample"
    }
    template {
      container {
        image = "uid09552/goexamplefrontend:latest"
        name  = "frontend"

        port {
          container_port = 8080
        }

        resources {
          limits {
            cpu    = "0.5"
            memory = "512Mi"
          }
          requests {
            cpu    = "250m"
            memory = "50Mi"
          }
        }
      }
    container {
        image = "uid09552/goexamplebackend:latest"
        name  = "backend"

        port {
          container_port = 8081
        }

        resources {
          limits {
            cpu    = "0.5"
            memory = "512Mi"
          }
          requests {
            cpu    = "250m"
            memory = "50Mi"
          }
        }
      }
      
    }
  }
}

resource "kubernetes_service" "frontend" {
  metadata {
    name = "frontend-rp"
  }
  spec {
    selector {
      App = "${kubernetes_replication_controller.goexample.metadata.0.labels.App}"
    }
    port {
      port = 8080
      target_port = 9090
      node_port = 32000
    }

    type = "NodePort"
  }
}
