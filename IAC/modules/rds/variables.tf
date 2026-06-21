variable "vpc_id" {
  description = "The ID of the VPC"
  type        = string
}
variable "allowed_cidr" {
  description = "The allowed CIDR block for the security group"
  type        = string
}
variable "subnet_ids" {
  description = "The list of subnet IDs for the RDS subnet group"
  type        = list(string)
}
variable "db_username" {
  description = "The username for the RDS database"
  type        = string
}
variable "db_password" {
  description = "The password for the RDS database"
  type        = string
}
variable "ec2sg" {
  description = "adding ec2sg to rds"
  type        = string
}   
