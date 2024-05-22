#!/bin/bash

# Apply를 원하는 YAML 파일들의 경로 목록
yaml_files=(
    "code-aws/namespace.yaml"
    "code-aws/nginx_cm.yaml"
    "code-aws/service_account.yaml"
    "code-aws/aws-db-dns.yaml"
    "code-aws/aws-secret.yaml"
    "code-aws/was-dep.yaml"
    "code-aws/was-svc.yaml"
    "code-aws/web-dep.yaml"
    "code-aws/web-svc.yaml"
    "code-aws/ingress.yaml"
)

# 각 YAML 파일을 순서대로 적용
for file in "${yaml_files[@]}"; do
    kubectl apply -f "$file"
done