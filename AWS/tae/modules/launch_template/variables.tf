variable "image_id" {
  description = "The AMI for Launch Template to Make Application Worker Node Instance"
  type        = string
  default     = ""
}

variable "instance_type" {
  description = "The Instance Type for Launch Template to Make Application Worker Node Instance"
  type        = string
  default     = "t2.medium"
}

variable "launch_template_sg_ids" {
  description = "The Security Group IDs for Launch Template to Make Application Worker Node Instance"
  type        = list(string)
  default     = []
}

variable "key_name" {
  description = "Key Pair Name Values for Launch Template to Make Application Worker Node Instance"
  type        = string
  default     = ""
}