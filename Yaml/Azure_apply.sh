#!/bin/bash

# Apply를 원하는 YAML 파일들의 경로 목록
yaml_files=(
    "namespace.yaml"
    "nginx_cm.yaml"
    "service_account.yaml"
    "azure-db-dns.yaml"
    "azure-secret.yaml"
    "was-dep.yaml"
    "was-svc.yaml"
    "web-dep.yaml"
    "web-svc.yaml"
    "ingress.yaml"
)

# 각 YAML 파일을 순서대로 적용
for file in "${yaml_files[@]}"; do
    kubectl apply -f "$file"
done
