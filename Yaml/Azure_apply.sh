#!/bin/bash

# Apply를 원하는 YAML 파일들의 경로 목록
yaml_files=(
    "code-base/ingress-controller.yaml"
    "code-base/namespace.yaml"
    "https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/ha/install.yaml"
    "code-base/nginx_cm.yaml"
    "code-azure/service_account.yaml"
    "code-azure/azure-db-dns.yaml"
    "code-azure/azure-secret.yaml"
    "code-base/was-dep.yaml"
    "code-base/was-svc.yaml"
    "code-base/web-dep.yaml"
    "ccode-base/web-svc.yaml"
    "code-azure/azure-ingress.yaml"
)

# 각 YAML 파일을 순서대로 적용
for file in "${yaml_files[@]}"; do
    kubectl apply -f "$file"
done