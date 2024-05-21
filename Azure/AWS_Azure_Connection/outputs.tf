output "aws_azure_connection" {
  value = "aws: ${var.aws_loc} <---> azure: ${var.az_loc}"
}

output "aws_azure_ip_range" {
  value = "aws: ${var.aws_vpc_ip_block} <---> azure: ${var.az_vnet_ip}"
}

# output "primary_connection_string" {
#     value = data.azurerm_storage_account.sa.primary_connection_string
#     sensitive = true
# }