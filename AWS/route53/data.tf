data "aws_route53_zone" "selected" {
  name         = var.hostname
#   private_zone = false
}