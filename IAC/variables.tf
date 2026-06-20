variable "instance_type" {
  description = "The instance type for the EC2 instance"
  type        = string
}
variable "key_name" {
  description = "The key pair name for the EC2 instance"
  type        = string
}
variable "ami_id" {
  description = "The AMI ID for the EC2 instance"
  type        = string
}
variable "cidr_block" {
  description = "The CIDR block for the VPC"
  type        = string
}
variable "subnet_block_public1" {
  description = "The CIDR block for the public subnet"
  type        = string
}
variable "subnet_block_public2" {
  description = "The CIDR block for the public subnet"
  type        = string
}
variable "subnet_block_private1" {
  description = "The CIDR block for the private subnet"
  type        = string
}
variable "subnet_block_private2" {
  description = "The CIDR block for the private subnet"
  type        = string
}
variable "availability_zone_public_1" {
  description = "The availability zone for the public subnet"
  type        = string
}
variable "availability_zone_public_2" {
  description = "The availability zone for the public subnet"
  type        = string
}
variable "availability_zone_private_1" {
  description = "The availability zone for the private subnet"
  type        = string
}
variable "availability_zone_private_2" {
  description = "The availability zone for the private subnet"
  type        = string
}
variable "ecr_repo_name" {
  description = "The name of the ECR repository"
  type        = string
}
variable "db_username" {
  description = "Database username"
  type        = string
}

variable "db_password" {
  description = "Database password"
  type        = string
  sensitive   = true
}

variable "allowed_cidr" {
  description = "CIDR range allowed to access the RDS instance"
  type        = string
}
variable "min_size" {
  description = "Minimum number of EKS node group worker nodes"
  type        = number
  default     = 1
}
variable "max_size" {
  description = "Maximum number of EKS node group worker nodes"
  type        = number
  default     = 3
}
variable "desired_capacity" {
  description = "Desired number of EKS node group worker nodes"
  type        = number
  default     = 2
}
variable "instance_types" {
  description = "Instance types for the EKS node group"
  type        = list(string)
  default     = ["t3.medium"]
}
variable "cluster_name" {
  description = "The name of the EKS cluster"
  type        = string
}
variable "aws_region" {
  description = "The AWS region to deploy resources"
  type        = string
  default     = "us-east-1"
}
