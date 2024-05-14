resource "aws_launch_template" "final_launch_template" {
    description = "Launch Template for Application Node Group"
    name = "Final-Application"
    image_id      = var.image_id
    instance_type = var.instance_type
    vpc_security_group_ids = var.launch_template_sg_ids
    key_name = var.key_name
    block_device_mappings {
        device_name = "/dev/xvda"

        ebs {
          delete_on_termination = true
          volume_size = 20
          volume_type = "gp2"
        }
    }

    lifecycle {
      create_before_destroy = true
    }
}