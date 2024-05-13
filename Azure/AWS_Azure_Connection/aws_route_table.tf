resource "aws_route_table" "routetable1" {
  vpc_id = data.aws_vpc.vpc.id

  tags = {
    Name = "VPN-Routing-Table"
  }

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_route_table_association" "RouteAndSub1" {
  subnet_id      = aws_subnet.subnet1.id
  route_table_id = aws_route_table.routetable1.id

  lifecycle {
    create_before_destroy = true
  }
}