#!/bin/bash

# 삭제를 원하는 YAML 파일들의 경로 목록
ingress=(
    "azure/argroCD/ingress.yaml"
    "azure/dev/ingress.yaml"
)
argo=(
    "https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/ha/install.yaml"
)
app=(
  "azure/dev/web-svc.yaml"
  "azure/dev/web-dep.yaml"
  "azure/dev/was-svc.yaml"
  "azure/dev/was-dep.yaml"
  "azure/dev/env-secret.yaml"
  "azure/dev/db-svc.yaml"
  "azure/dev/service-account.yaml"
  "azure/dev/nginx_cm.yaml"
)
base=(
  "azure/argoCD/namespace.yaml"
  "azure/dev/namespace.yaml"
  "base/ingress-controller.yaml"
)


# Ingress YAML 파일을 역순으로 삭제
for file in "${ingress[@]}"; do
    kubectl delete -f "$file"
done

# ArgoCD YAML 파일을 역순으로 삭제
for file in "${argo[@]}"; do
    kubectl delete -f "$file" -n argocd
done

# Application YAML 파일을 역순으로 삭제
for file in "${app[@]}"; do
    kubectl delete -f "$file"
done

# Ingress Controller & NameSpace YAML 파일을 역순으로 삭제
for file in "${base[@]}"; do
    kubectl delete -f "$file"
done