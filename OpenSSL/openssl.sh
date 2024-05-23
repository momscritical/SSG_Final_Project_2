#!/bin/bash

# 변수 설정
KEY_FILE="argo.key"
CSR_FILE="argo.csr"
CRT_FILE="argo.crt"
PASSWORD="12345"
OPENSSL_CONFIG="openssl.cnf"

# 개인 키 생성
openssl genrsa -out $KEY_FILE 2048

# 설정 파일을 사용하여 CSR 생성
openssl req -new -key $KEY_FILE -out $CSR_FILE -config $OPENSSL_CONFIG -passout pass:$PASSWORD

# 셀프 서명된 인증서 생성
openssl x509 -req -in $CSR_FILE -signkey $KEY_FILE -out $CRT_FILE

echo "개인 키, CSR, 그리고 셀프 서명된 인증서가 생성되었습니다:"
echo "개인 키: $KEY_FILE"
echo "인증서: $CRT_FILE"