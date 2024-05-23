#!/bin/bash

# Apply를 원하는 YAML 파일들의 경로 목록
yaml_files=(
    "code-base/ingress-controller.yaml"
    "code-base/namespace.yaml"
    "code-base/nginx_cm.yaml"
    "code-aws/service_account.yaml"
    "code-aws/aws-db-dns.yaml"
    "code-aws/aws-secret.yaml"
    "code-base/was-dep.yaml"
    "code-base/was-svc.yaml"
    "code-base/web-dep.yaml"
    "ccode-base/web-svc.yaml"
)

# 각 YAML 파일을 순서대로 적용
for file in $yaml_files; do
    kubectl apply -f "$file"
done

kubectl apply -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/ha/install.yaml -n argocd
kubectl apply -f code-aws/aws-ingress.yaml