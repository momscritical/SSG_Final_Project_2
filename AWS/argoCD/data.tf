data "http" "argo_cd_install_yaml" {
  url = "https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/ha/install.yaml"
}