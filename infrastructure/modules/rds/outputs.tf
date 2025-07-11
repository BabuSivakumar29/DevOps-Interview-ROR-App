#output "vpc_id" {
#  value = aws_vpc.main.id
#}

#output "private_subnet_ids" {
#  value = [for subnet in aws_subnet.private : subnet.id]
#}

output "rds_security_group_id" {
  value = aws_security_group.rds_sg.id
}

output "rds_subnet_group" {
  value = aws_db_subnet_group.rds_subnet_group.name
}

output "rds_endpoint" {
  value = aws_db_instance.postgres.endpoint
}

output "rds_address" {
  value = aws_db_instance.postgres.address
}
