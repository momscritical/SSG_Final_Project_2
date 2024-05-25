#################################### AWS Values ####################################
variable "region" {
  description = "AWS region Values"
  type        = string
  default     = "ap-northeast-1"
  sensitive = true
}

variable "hostname" {
  description = "AWS Route 53 Host Name Values"
  type        = string
  default     = "jumjoo.com"
  sensitive = true
}

variable "lb_name" {
  type    = string
  default = ""
}