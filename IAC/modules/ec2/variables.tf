variable "ami_id" {
  description = "The AMI ID for the EC2 instance"
  type        = string
}

variable "instance_type" {
  description = "The instance type for the EC2 instance"
  type        = list(string)
}

variable "key_name" {
  description = "The key pair name for the EC2 instance"
  type        = string
}

variable "subnet_id" {
  description = "The subnet ID for the EC2 instance"
  type        = string
}
variable "vpc_id" {
  description = "The ID of the VPC"
  type        = string
}
variable "allowed_cidr" {
  description = "List of CIDR blocks allowed to access the Jump Server through SSH and HTTP."
  type        = list(string)
  default     = ["0.0.0.0/0"]
}
variable "aws_region" {
  description = "The AWS region to deploy resources"
  type        = string
}