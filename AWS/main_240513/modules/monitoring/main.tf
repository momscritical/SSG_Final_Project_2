resource "kubernetes_namespace" "prometheus-namespace" { # namespace 생성
  metadata {
    name = "prometheus"
  }
  lifecycle {
    create_before_destroy = true
  }
}

resource "helm_release" "prometheus" { # Helm 릴리스 설정
  name       = "prometheus" # 릴리스 이름 설정
  repository = "https://prometheus-community.github.io/helm-charts" # 사용할 Helm 차트 저장소 URL 설정
  chart      = "kube-prometheus-stack" # 설치할 Helm 차트 이름 설정
  namespace  = kubernetes_namespace.prometheus-namespace.id # 설치할 네임스페이스 지정
  create_namespace = true # 지정된 네임스페이스가 없는 경우 자동으로 생성할지 여부 설정
  version    = "45.7.1" # 설치할 Helm 차트의 버전 설정
  values = [ # Helm 차트를 설치할 때 사용할 값 설정
    file("${var.prometheus_yaml_loc}") # YAML 파일 경로 설정
  ]
  timeout = 2000 # Helm 차트 설치가 완료되기까지 대기할 최대 시간 설정

  set { # 설정 설정
    name  = "podSecurityPolicy.enabled" # Pod Security Policy 활성화 여부 설정
    value = true
  }

  set { # 설정 설정
    name  = "server.persistentVolume.enabled" # Prometheus 서버에 대한 영구 볼륨 사용 설정
    value = false
  }

  # You can provide a map of value using yamlencode. Don't forget to escape the last element after point in the name
  set { # 설정 설정
    name = "server\\.resources" # Prometheus 서버의 자원 요청 및 제한 설정
    value = yamlencode({ # YAML 형식으로 값을 지정
      limits = {
        cpu    = "200m" # CPU 요청 및 제한 설정
        memory = "50Mi" # 메모리 요청 및 제한 설정
      }
      requests = {
        cpu    = "100m" # CPU 요청 및 제한 설정
        memory = "30Mi" # 메모리 요청 및 제한 설정
      }
    })
  }
}