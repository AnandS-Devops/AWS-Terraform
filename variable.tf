variable "vpc_cidr" {
  description = "cidr block for vpc"
  type        = string
}

variable "vpc_name" {
  description = "Name of the VPC"
  type        = string

}

variable "public_subnet" {
  description = "CIDR block for public subnet"
  type        = list(string)

}

variable "private_subnet" {
  description = "CIDR block for private subnet"
  type        = list(string)

}

variable "zones" {
  description = "List of availability zones"
  type        = list(string)

}

variable "alb_sg" {
  description = "Security group for ALB"
  type        = string

}

variable "lb_sg" {
  description = "Name of the security group for ALB"
  type        = string

}

variable "igw_name" {
  description = "Name of the Internet Gateway"
  type        = string

}

