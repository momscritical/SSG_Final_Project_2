output "host_name" {
  value = data.aws_route53_zone.selected.name
  sensitive = true
}

output "name" {
  value = data.aws_route53_zone.selected.name_servers
}

output "resource_record_set_count" {
  value = data.aws_route53_zone.selected.resource_record_set_count
}

output "linked_service_description" {
  value = data.aws_route53_zone.selected.linked_service_description
}

output "linked_service_principal" {
  value = data.aws_route53_zone.selected.linked_service_principal
}

output "caller_reference" {
  value = data.aws_route53_zone.selected.caller_reference
}

output "Comment" {
  value = data.aws_route53_zone.selected.comment
}

output "arn" {
  value = data.aws_route53_zone.selected.arn
}

###
output "ingress_status" {
  value = data.kubernetes_ingress.example.status
}

# output "ingress_load_balancer" {
#   value = data.kubernetes_ingress.example.load_balancer
# }

# output "ingress_ingress" {
#   value = data.kubernetes_ingress.example.ingress
# }

# output "ingress_ip" {
#   value = data.kubernetes_ingress.example.ip
# }

# output "hostname" {
#   value = data.kubernetes_ingress.example.hostname
# }