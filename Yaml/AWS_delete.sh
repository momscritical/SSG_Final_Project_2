#!/bin/bash

# 삭제를 원하는 YAML 파일들의 경로 목록
ingress=(
    "code-aws/aws-ingress.yaml"
)
argo=(
    "https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/ha/install.yaml"
)
app=(
    "code-base/web-svc.yaml"
    "code-base/web-dep.yaml"
    "code-base/was-svc.yaml"
    "code-base/was-dep.yaml"
    "code-aws/aws-secret.yaml"
    "code-aws/aws-db-dns.yaml"
    "code-aws/service_account.yaml"
    "code-base/nginx_cm.yaml"
)
base=(
    "code-base/namespace.yaml"
    "code-base/ingress-controller.yaml"
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