# 클러스터의 엔드포인트 정보 출력
output "cluster_endpoint" {
  value = aws_eks_cluster.cluster.endpoint
}

# kubectl 명령어를 사용하여 클러스터에 연결하는 데 필요한 인증 기관 데이터 출력
output "kubeconfig-certificate-authority-data" {
  value = aws_eks_cluster.cluster.certificate_authority[0].data
}

output "app_asg_tag" {
  value = aws_eks_node_group.app.tags["ASG-Tag"]
}

output "app_asg_name" {
  value = aws_eks_node_group.app.resources[0].autoscaling_groups[0].name
}

output "cluster_issuer" {
  value = aws_eks_cluster.cluster.identity[0].oidc[0].issuer
}

output "cluster_id" {
  value = aws_eks_cluster.cluster.cluster_id
}