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

# YAML 파일 적용 함수
apply_yaml() {
    for file in "${@}"; do
        kubectl apply -f "$file" "$@"
    done
}

# Ingress Controller & NameSpace YAML 파일 적용
apply_yaml "${base[@]}"

# Application YAML 파일 적용
apply_yaml "${app[@]}"

# TLS 인증서를 Kubernetes 시크릿으로 추가
kubectl create secret tls argo-secret --cert /home/konan/ssl/argo.crt --key /home/konan/ssl/argo.key -n argocd

# ArgoCD YAML 파일 적용
apply_yaml "${argo[@]}" -n argocd

# Ingress YAML 파일 적용
apply_yaml "${ingress[@]}" -n argocd

# ArgoCD 초기 비밀번호 출력
kubectl -n argocd get secret argocd-initial-admin-secret -o jsonpath="{.data.password}" | base64 -d; echo