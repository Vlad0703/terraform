output "nat_id" {
    value = aws_nat_gateway.nat_gateway.id
}

output "publ_id" {
    value = aws_subnet.public.id
}