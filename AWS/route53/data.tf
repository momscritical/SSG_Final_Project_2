data "aws_route53_zone" "selected" {
  name         = var.hostname
#   private_zone = false
}

data "kubernetes_ingress" "example" {
  metadata {
    name = "application-ingress"
    namespace = "dev"
  }
  
}

# variable "lb_hostname" {
#   type = string
# }

# locals {
#   value = command("kubectl get ingress -n dev -o jsonpath='{.items[*].status.loadBalancer.ingress[0].hostname}'")
# }


# data "aws_elb" "test" {
#   name = var.lb_name
# }