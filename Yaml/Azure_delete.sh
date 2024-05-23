#!/bin/bash

# Apply를 원하는 YAML 파일들의 경로 목록
yaml_files=(
    "code-azure/azure-ingress.yaml"
    "code-base/web-svc.yaml"
    "code-base/web-dep.yaml"
    "code-base/was-svc.yaml"
    "code-base/was-dep.yaml"
    "code-azure/azure-secret.yaml"
    "code-azure/azure-db-dns.yaml"
    "code-azure/service_account.yaml"
    "code-base/nginx_cm.yaml"
    "https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/ha/install.yaml"
    "code-base/namespace.yaml"
    "https://raw.githubusercontent.com/kubernetes/ingress-nginx/controller-v1.10.1/deploy/static/provider/cloud/deploy.yaml"
)

# 각 YAML 파일을 역순으로 적용
for ((i=${#yaml_files[@]}-1; i>=0; i--)); do
    file="${yaml_files[$i]}"
    if [ "$file" == "https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/ha/install.yaml" ]; then
        kubectl apply -f "$file" -n argocd
    else
        kubectl apply -f "$file"
    fi
done
