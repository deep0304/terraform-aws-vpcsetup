#------public-route-table------#
resource "aws_route_table" "public_route_table" {
  vpc_id = aws_vpc.new_vpc_name.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.internet_gateway.id
  }



  tags = {
    Name = "public route table for the subnet"
  }
}
resource "aws_route_table_association" "public_rt_association" {
  subnet_id      = aws_subnet.new_public_subnet.id
  route_table_id = aws_route_table.public_route_table.id
}

#-------private-route-table-------#
resource "aws_route_table" "private_route_table" {
  vpc_id = aws_vpc.new_vpc_name.id
  tags = {
    Name = "Route Table for the Private Subnet"
  }
}
