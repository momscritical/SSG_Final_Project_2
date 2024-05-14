#!/bin/bash

# Apply를 원하는 YAML 파일들의 경로 목록
yaml_files=(
    "code/ingress-controller.yaml"
    "code/namespace.yaml"
    "code/nginx_cm.yaml"
    "code/service_account.yaml"
    "code/azure-db-dns.yaml"
    "code/azure-secret.yaml"
    "code/was-dep.yaml"
    "code/was-svc.yaml"
    "code/web-dep.yaml"
    "code/web-svc.yaml"
    "code/ingress.yaml"
)

# 각 YAML 파일을 순서대로 적용
for file in "${yaml_files[@]}"; do
    kubectl apply -f "$file"
done
