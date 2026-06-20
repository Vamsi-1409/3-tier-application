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