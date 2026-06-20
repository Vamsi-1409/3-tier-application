output "vpc_id" {
  value = aws_vpc.VPC.id
}

output "subnet_ids_private" {
  value = [
    aws_subnet.subnetPrivate1.id,
    aws_subnet.subnetPrivate2.id
  ]
}

output "subnet_ids_public" {
  value = [
    aws_subnet.subnetPublic1.id,
    aws_subnet.subnetPublic2.id
  ]
}

output "private_subnet_ids" {
  value = [
    aws_subnet.subnetPrivate1.id,
    aws_subnet.subnetPrivate2.id
  ]
}

output "public_subnet_ids" {
  value = [
    aws_subnet.subnetPublic1.id,
    aws_subnet.subnetPublic2.id
  ]
}