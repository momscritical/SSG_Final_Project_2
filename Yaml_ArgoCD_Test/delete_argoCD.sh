#!/bin/bash

# 삭제를 원하는 YAML 파일들의 경로 목록
argo=(
    "https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/ha/install.yaml"
)

base=(
  "azure/dev/namespace.yaml"
)

# ArgoCD YAML 파일을 역순으로 삭제
for file in "${argo[@]}"; do
    kubectl delete -f "$file" -n argocd
done

# NameSpace YAML 파일을 역순으로 삭제
for file in "${base[@]}"; do
    kubectl delete -f "$file"
done