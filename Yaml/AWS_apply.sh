#!/bin/bash

# Apply를 원하는 YAML 파일들의 경로 목록
yaml_files=(
    "code-base/ingress-controller.yaml"
    "code-base/namespace.yaml"
    "https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/ha/install.yaml"
    "code-base/nginx_cm.yaml"
    "code-aws/service_account.yaml"
    "code-aws/aws-db-dns.yaml"
    "code-aws/aws-secret.yaml"
    "code-base/was-dep.yaml"
    "code-base/was-svc.yaml"
    "code-base/web-dep.yaml"
    "code-base/web-svc.yaml"
    "code-aws/aws-ingress.yaml"
)

# 각 YAML 파일을 순서대로 적용
# for file in "${yaml_files[@]}"; do
#     kubectl apply -f "$file"
# done

# 각 YAML 파일을 순서대로 적용
for file in "${yaml_files[@]}"; do
    if [ "$file" == "https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/ha/install.yaml" ]; then
        kubectl apply -f "$file" -n argocd
    else
        kubectl apply -f "$file"
    fi
done