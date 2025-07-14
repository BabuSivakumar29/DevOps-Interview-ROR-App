output "rds_security_group_id" {
  value = aws_security_group.rds_sg.id
}

output "rds_subnet_group" {
  value = aws_db_subnet_group.rds_subnet_group.name
}

output "rds_endpoint" {
  value = aws_db_instance.postgres.endpoint
}

output "rds_hostname" {
  value = aws_db_instance.postgres.address
}
