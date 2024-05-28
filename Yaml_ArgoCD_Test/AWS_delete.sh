#!/bin/bash

# 삭제를 원하는 YAML 파일들의 경로 목록
ingress=(
    "aws/prometheus/ingress.yaml"
    "aws/argroCD/ingress.yaml"
    "aws/dev/ingress.yaml"
)
argo=(
    "https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/ha/install.yaml"
)
app=(
  "aws/dev/web-svc.yaml"
  "aws/dev/web-dep.yaml"
  "aws/dev/was-svc.yaml"
  "aws/dev/was-dep.yaml"
  "base_secret/aws-secret.yaml"
  "aws/dev/db-svc.yaml"
  "aws/dev/service-account.yaml"
  "aws/dev/nginx-cm.yaml"
)
base=(
  "aws/argoCD/namespace.yaml"
  "aws/dev/namespace.yaml"
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