#!/bin/bash

# Apply를 원하는 YAML 파일들의 경로 목록
base=(
    "code-base/ingress-controller.yaml"
    "code-base/namespace.yaml"
)
app=(
    "code-base/nginx_cm.yaml"
    "code-aws/service_account.yaml"
    "code-aws/aws-db-dns.yaml"
    "code-aws/aws-secret.yaml"
    "code-base/was-dep.yaml"
    "code-base/was-svc.yaml"
    "code-base/web-dep.yaml"
    "code-base/web-svc.yaml"
)
argo=(
    "https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/ha/install.yaml"
)
ingress=(
    "code-aws/aws-ingress.yaml"
)

# Ingress Controller & NameSpace YAML 파일을 순서대로 적용
for file in "${base[@]}"; do
        kubectl apply -f "$file"
done

# Application YAML 파일을 순서대로 적용
for file in "${app[@]}"; do
        kubectl apply -f "$file"
done

# TLS 인증서를 Kubernetes 시크릿으로 추가
kubectl create secret tls argo-secret --cert ../OpenSSL/argo.crt --key ../OpenSSL/argo.key -n argocd

# ArgoCD YAML 파일을 순서대로 적용
for file in "${argo[@]}"; do
        kubectl apply -f "$file" -n argocd
done

# Ingress YAML 파일을 순서대로 적용
for file in "${ingress[@]}"; do
        kubectl apply -f "$file" -n argocd
done

kubectl -n argocd get secret argocd-initial-admin-secret -o jsonpath="{.data.password}" | base64 -d; echo