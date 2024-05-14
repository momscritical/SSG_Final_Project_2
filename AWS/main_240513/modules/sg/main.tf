resource "aws_security_group" "bastion" {
  name        = var.bastion_sg_name
  description = "Security Group for Bastion"
  vpc_id      = var.vpc_id

  dynamic "ingress" {
    for_each = var.bastion_ing_rules
    content {
      from_port       = ingress.value.from_port
      to_port         = ingress.value.to_port
      protocol        = "tcp"
      cidr_blocks     = ["0.0.0.0/0"]
    }
  }

  egress {
    from_port     = 0
    to_port       = 0
    protocol      = "-1"
    cidr_blocks   = ["0.0.0.0/0"]
  }

  tags = {
    Name = var.bastion_sg_name
  }
}

resource "aws_security_group" "cp" {
  name        = var.cp_sg_name
  description = "Security Group for Control Plane"
  vpc_id      = var.vpc_id

  dynamic "ingress" {
    for_each = var.cp_ing_rules
    content {
      from_port       = ingress.value.from_port
      to_port         = ingress.value.to_port
      protocol        = "tcp"
      security_groups = ingress.value.security_groups
    }
  }

  egress {
    from_port     = 0
    to_port       = 0
    protocol      = "-1"
    cidr_blocks   = ["0.0.0.0/0"]
  }

  tags = {
    Name = var.cp_sg_name
  }
}

resource "aws_security_group" "app" { 
  name        = var.app_sg_name
  description = "Security Group for Application Nodes"
  vpc_id      = var.vpc_id

  dynamic "ingress" {
    for_each = var.app_ing_rules
    content {
      from_port       = ingress.value.from_port
      to_port         = ingress.value.to_port
      protocol        = "tcp"
      security_groups = ingress.value.security_groups
    }
  }

  egress {
    from_port     = 0
    to_port       = 0
    protocol      = "-1"
    cidr_blocks   = ["0.0.0.0/0"]
  }

  tags = {
    Name = var.app_sg_name
  }
}

resource "aws_security_group" "set" {
  name        = var.set_sg_name
  description = "Security Group for was EKS Setting Node" 
  vpc_id      = var.vpc_id

  dynamic "ingress" {
    for_each = var.set_ing_rules
    content {
      from_port       = ingress.value.from_port
      to_port         = ingress.value.to_port
      protocol        = "tcp"
      security_groups = ingress.value.security_groups
    }
  }

  egress {
    from_port     = 0
    to_port       = 0
    protocol      = "-1"
    cidr_blocks   = ["0.0.0.0/0"]
  }

  tags = {
    Name = var.set_sg_name
  }
}

resource "aws_security_group" "db" {
  name        = var.db_sg_name
  description = "Security Group for RDS DB" 
  vpc_id      = var.vpc_id

  dynamic "ingress" {
    for_each = var.db_ing_rules
    content {
      from_port       = ingress.value.from_port
      to_port         = ingress.value.to_port
      protocol        = "tcp"
      security_groups = ingress.value.security_groups
    }
  }

  egress {
    from_port     = 0
    to_port       = 0
    protocol      = "-1"
    cidr_blocks   = ["0.0.0.0/0"]
  }

  tags = {
    Name = var.db_sg_name
  }
}

resource "aws_security_group" "ext_lb" {
  name        = var.elb_sg_name
  description = "Security Group for External Load Balancer" 
  vpc_id      = var.vpc_id

  dynamic "ingress" {
    for_each = var.elb_ing_rules
    content {
      from_port       = ingress.value.from_port
      to_port         = ingress.value.to_port
      protocol        = "tcp"
    cidr_blocks   = ["0.0.0.0/0"]
    }
  }

  egress {
    from_port     = 0
    to_port       = 0
    protocol      = "-1"
    cidr_blocks   = ["0.0.0.0/0"]
  }

  tags = {
    Name = var.elb_sg_name
  }
}