#!/bin/bash

# Install Ingress Nginx Controller
kubectl delete -f base_secret/ingress-controller.yaml

# ArgoCD YAML 파일을 역순으로 삭제
for file in "${argo[@]}"; do
    kubectl delete -f "$file"
done