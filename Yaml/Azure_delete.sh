#!/bin/bash

# 삭제를 원하는 YAML 파일들의 경로 목록
ingress=(
    "code-azure/azure-ingress.yaml"
)
argo=(
    "https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/ha/install.yaml"
)
app=(
    "code-base/web-svc.yaml"
    "code-base/web-dep.yaml"
    "code-base/was-svc.yaml"
    "code-base/was-dep.yaml"
    "code-azure/azure-secret.yaml"
    "code-azure/azure-db-dns.yaml"
    "code-azure/service_account.yaml"
    "code-base/nginx_cm.yaml"
)
base=(
    "code-base/namespace.yaml"
    "code-base/ingress-controller.yaml"
)

# Ingress YAML 파일을 역순으로 삭제
for file in "${ingress[@]}"; do
    kubectl delete -f "$file"
done

# ArgoCD YAML 파일을 역순으로 삭제
for file in "${argo[@]}"; do
    kubectl delete -f "$file" -n argocd
done

# Application YAML 파일을 역순으로 삭제
for file in "${app[@]}"; do
    kubectl delete -f "$file"
done

# TLS 인증서 삭제
kubectl delete secret argo-secret -n argocd

# Ingress Controller & NameSpace YAML 파일을 역순으로 삭제
for file in "${base[@]}"; do
    kubectl delete -f "$file"
done