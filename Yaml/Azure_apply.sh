#!/bin/bash

# Apply를 원하는 YAML 파일들의 경로 목록
yaml_files=(
    "code-azure/ingress-controller.yaml"
    "code-azure/namespace.yaml"
    "code-azure/nginx_cm.yaml"
    "code-azure/service_account.yaml"
    "code-azure/azure-db-dns.yaml"
    "code-azure/azure-secret.yaml"
    "code-azure/was-dep.yaml"
    "code-azure/was-svc.yaml"
    "code-azure/web-dep.yaml"
    "code-azure/web-svc.yaml"
    "code-azure/ingress.yaml"
)

# 각 YAML 파일을 순서대로 적용
for file in "${yaml_files[@]}"; do
    kubectl apply -f "$file"
done