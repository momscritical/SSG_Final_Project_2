# resource "kubernetes_namespace" "prometheus-namespace" { # namespace 생성
#   metadata {
#     name = "prometheus"
#   }
# }
# resource "helm_release" "prometheus" { # helm release 를 사용해서 prometheus 설치 
#   name       = "prometheus"
#   repository = "https://prometheus-community.github.io/helm-charts"
#   chart      = "kube-prometheus-stack"
#   namespace  = kubernetes_namespace.prometheus-namespace.id
#   create_namespace = true
#   version    = "45.7.1"
#   values = [
#     file("../../Yaml/prometheus_values.yaml")
#   ]
#   timeout = 2000


#   set {
#     name  = "podSecurityPolicy.enabled"
#     value = true
#   }

#   set {
#     name  = "server.persistentVolume.enabled"
#     value = false
#   }

#   # You can provide a map of value using yamlencode. Don't forget to escape the last element after point in the name
#   set {
#     name = "server\\.resources"
#     value = yamlencode({
#       limits = {
#         cpu    = "200m"
#         memory = "50Mi"
#       }
#       requests = {
#         cpu    = "100m"
#         memory = "30Mi"
#       }
#     })
#   }
# }
