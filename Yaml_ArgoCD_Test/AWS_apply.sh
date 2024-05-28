#!/bin/bash

# Apply를 원하는 YAML 파일들의 경로 목록
base=(
    "base_secret/ingress-controller.yaml"
    "aws/dev/namespace.yaml"
    "aws/argoCD/namespace.yaml"
)
app=(
    "aws/dev/nginx_cm.yaml"
    "aws/dev/service-account.yaml"
    "aws/dev/db-svc.yaml"
    "base_secret/aws-secret.yaml"
    "aws/dev/was-dep.yaml"
    "aws/dev/was-svc.yaml"
    "aws/dev/web-dep.yaml"
    "aws/dev/web-svc.yaml"
)
argo=(
    "https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/ha/install.yaml"
)
ingress=(
    "aws/dev/ingress.yaml"
    "aws/argroCD/ingress.yaml"
    "aws/prometheus/ingress.yaml"
)

# Ingress Controller & NameSpace YAML 파일을 순서대로 적용
for file in "${base[@]}"; do
        kubectl apply -f "$file"
done

# Application YAML 파일을 순서대로 적용
for file in "${app[@]}"; do
        kubectl apply -f "$file"
done

# TLS 인증서를 Kubernetes 시크릿으로 추가 (존재 여부 확인)
if ! kubectl get secret argo-secret -n argocd > /dev/null 2>&1; then
    kubectl create secret tls argo-secret --cert ../OpenSSL/argo.crt --key ../OpenSSL/argo.key -n argocd
else
    echo "Secret argo-secret already exists"
fi

# ArgoCD YAML 파일을 순서대로 적용
for file in "${argo[@]}"; do
        kubectl apply -f "$file" -n argocd
done

# Ingress YAML 파일을 순서대로 적용
for file in "${ingress[@]}"; do
        kubectl apply -f "$file"
done

# ArgoCD 초기 비밀번호 출력
kubectl -n argocd get secret argocd-initial-admin-secret -o jsonpath="{.data.password}" | base64 -d; echo