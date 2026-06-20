variable "cluster_name" {
  description = "The name of the EKS cluster"
  type        = string

}

variable "eks_cluster_role_arn" {
  description = "The ARN of the IAM role for the EKS cluster"
  type        = string
}

variable "subnet_ids" {
  description = "The IDs of the subnets for the EKS cluster"
  type        = list(string)
}

variable "node_group_role_arn" {
  description = "The ARN of the IAM role for the EKS node group"
  type        = string
}
variable "desired_capacity" {
  description = "The desired capacity for the EKS node group"
  type        = number
}
variable "max_size" {
  description = "The maximum size for the EKS node group"
  type        = number
}
variable "min_size" {
  description = "The minimum size for the EKS node group"
  type        = number
}
variable "security_group_ids" {
  description = "The IDs of the security groups for the EKS cluster"
  type        = list(string)
  default     = []
}
variable "vpc_id" {
  description = "The ID of the VPC for the EKS cluster"
  type        = string
}
variable "instance_types" {
  description = "The instance types for the EKS node group"
  type        = list(string)
}
