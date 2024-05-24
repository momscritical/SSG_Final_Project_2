resource "aws_subnet" "subnet1" {
  vpc_id            = data.aws_vpc.vpc.id
  cidr_block        = var.aws_subnet_ip_block
  availability_zone = "${var.aws_loc}a"

  tags = {
    Name = "VPN-Gateway-subnet"
  }

  lifecycle {
    create_before_destroy = true
  }
}