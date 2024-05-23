resource "kubernetes_namespace" "argocd" { # namespace 생성
  metadata {
    name = "argocd"
  }
}

resource "kubernetes_manifest" "argo_cd_install" {
  manifest = yamldecode(data.http.argo_cd_install_yaml.response_body)
  depends_on = [kubernetes_namespace.argocd]
}