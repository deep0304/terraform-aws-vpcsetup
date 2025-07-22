#-------outputs----#
output "vpc_id" {
  value = aws_vpc.new_vpc_name.id

}
output "public_subnet_id" {
  value = aws_subnet.new_public_subnet.id
}

output "security_group_id" {
  value = aws_security_group.web_sg.id
}
