resource "aws_route53_record" "www" {
  zone_id = data.aws_route53_zone.selected.zone_id
  name    = "www.${data.aws_route53_zone.selected.name}"
  type    = "A"
  ttl     = "300"
  records = ["10.0.0.1"]
}

# resource "aws_elb" "main" {
#   name               = "foobar-terraform-elb"
#   availability_zones = ["us-east-1c"]

#   listener {
#     instance_port     = 80
#     instance_protocol = "http"
#     lb_port           = 80
#     lb_protocol       = "http"
#   }
# }

# resource "aws_route53_record" "www" {
#   zone_id = aws_route53_zone.primary.zone_id
#   name    = "example.com"
#   type    = "A"

#   alias {
#     name                   = aws_elb.main.dns_name
#     zone_id                = aws_elb.main.zone_id
#     evaluate_target_health = true
#   }
# }
