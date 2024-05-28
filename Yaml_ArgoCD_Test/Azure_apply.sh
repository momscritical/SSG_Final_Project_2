#!/bin/bash

# Apply를 원하는 YAML 파일들의 경로 목록
base=(
    "base/ingress-controller.yaml"
    "azure/dev/namespace.yaml"
    "azure/argoCD/namespace.yaml"
)
app=(
    "azure/dev/nginx_cm.yaml"
    "azure/dev/service-account.yaml"
    "azure/dev/db-svc.yaml"
    "azure/dev/env-secret.yaml"
    "azure/dev/was-dep.yaml"
    "azure/dev/was-svc.yaml"
    "azure/dev/web-dep.yaml"
    "azure/dev/web-svc.yaml"
)
argo=(
    "https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/ha/install.yaml"
)
ingress=(
    "azure/dev/ingress.yaml"
    "azure/argroCD/ingress.yaml"
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