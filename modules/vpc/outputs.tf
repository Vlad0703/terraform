output "vpc_id" {
  value = aws_vpc.main.id
}

output "rt_id" {
  value = aws_vpc.main.main_route_table_id 
}
