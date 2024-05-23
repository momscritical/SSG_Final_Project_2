variable "yaml_location" {
  description = "Location of the Ingress Nginx Controller"
  type        = string
  default     = "./yaml/ingress-controller.yaml"
  sensitive = true
}

variable "cluster_endpoint" {
  description = "Ingress Nginx Controller End Point"
  type        = string
  default     = ""
  sensitive = true
}

variable "kubeconfig-certificate-authority-data" {
  description = "Certificate Authority Data"
  type        = string
  default     = ""
  sensitive = true
}