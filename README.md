# SSG_Final_Project_2
The submitted code is the final project of “K-Digital Training - 3rd Cloud
Service Development Course conducted by Shinsegae I&C”
The code was written based on training

< Change >
Region,
Availability Zones,
EKS Role Name,
IRSA Role Name,
RDS Subnet Group

< Make Secret.yaml >
aws-secret.yaml
//
apiVersion: v1
kind: Secret
metadata:
  namespace: dev
  name: my-secrets
type: Opaque
data:
  AZURE_CONNECTION_STRING: "" # Azure > 스토리지 계정 > 보안 + 네트워크 > 액세스키 > key1 > 연결 문자열 값을 base64 Encoking 해서 입력
  CLOUD_PROVIDER: "QVdT" # azure용과 이부분이 다름
//
azure-secret.yaml
//
apiVersion: v1
kind: Secret
metadata:
  namespace: dev
  name: my-secrets
type: Opaque
data:
  AZURE_CONNECTION_STRING: "" # Azure > 스토리지 계정 > 보안 + 네트워크 > 액세스키 > key1 > 연결 문자열 값을 base64 Encoking 해서 입력
  CLOUD_PROVIDER: "QVpVUkU=" # aws용과 이부분이 다름
  //