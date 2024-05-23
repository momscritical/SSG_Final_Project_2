#!/bin/bash

# 삭제할 YAML 파일들의 경로 목록
yaml_files=(
    "code-aws/aws-ingress.yaml"
    "code-base/web-svc.yaml"
    "code-base/web-dep.yaml"
    "code-base/was-svc.yaml"
    "code-base/was-dep.yaml"
    "code-aws/aws-secret.yaml"
    "code-aws/aws-db-dns.yaml"
    "code-aws/service_account.yaml"
    "code-base/nginx_cm.yaml"
    "https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/ha/install.yaml"
    "code-base/namespace.yaml"
    "code-base/ingress-controller.yaml"
)

# 각 YAML 파일을 역순으로 삭제
for ((i=${#yaml_files[@]}-1; i>=0; i--)); do
    file="${yaml_files[$i]}"
    if [ "$file" == "https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/ha/install.yaml" ]; then
        kubectl delete -f "$file" -n argocd
    else
        kubectl delete -f "$file"
    fi
done