data "aws_route53_zone" "selected" {
  name         = var.hostname
#   private_zone = false
}

data "kubernetes_ingress" "example" {
  metadata {
    name = "application-ingress"
    namespace = "dev"
    annotations = {
      "kubernetes.io/ingress.class" = "nginx"
      "nginx.ingress.kubernetes.io/rewrite-target" = "/"
    }
  }
  
}




# data "aws_elb" "test" {
#   name = var.lb_name
# }