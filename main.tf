#----vpc-----#
resource "aws_vpc" "new_vpc_name" {
  cidr_block = var.cidr_blocks_for_vpc
  tags = {
    Name = var.vpc_name
  }
}

resource "aws_default_network_acl" "default" {
  default_network_acl_id = aws_vpc.new_vpc_name.default_network_acl_id

  ingress {
    protocol   = -1
    rule_no    = 100
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port  = 0
    to_port    = 0
  }

  egress {
    protocol   = -1
    rule_no    = 100
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port  = 0
    to_port    = 0
  }
}
#------internet gatway-----------#
resource "aws_internet_gateway" "internet_gateway" {
  vpc_id = aws_vpc.new_vpc_name.id

  tags = {
    Name = "internet gateway for the vpc"
  }
}
#------public-subnet--------#
resource "aws_subnet" "new_public_subnet" {
  cidr_block              = var.cidr_blocks_for_public_subnet
  vpc_id                  = aws_vpc.new_vpc_name.id
  map_public_ip_on_launch = true
  tags = {
    Name = "new-vpc-public-subnet"
  }
}



#------private-subnet--------#
resource "aws_subnet" "new_private_subnet" {
  cidr_block = var.cidr_blocks_for_private_subnet
  vpc_id     = aws_vpc.new_vpc_name.id
  tags = {
    Name = "new-vpc-private-subnet"
  }
}

resource "aws_route_table_association" "route_table_associate_private" {
  subnet_id      = aws_subnet.new_private_subnet.id
  route_table_id = aws_route_table.private_route_table.id
}

