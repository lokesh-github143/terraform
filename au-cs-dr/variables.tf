// account and region variables
variable "account_id" {
  description = "name of the region"
  type        = string
}

variable "region" {
  description = "name of the DR region"
  type        = string
}
// tag variables
variable "env" {
  description = "tag value of env"
  type        = string
}

variable "prj" {
  description = "tag value of prj"
  type        = string
}

variable "cst" {
  description = "tag value of cst"
  type        = string
}

variable "owner" {
  description = "tag value of owner"
  type        = string
}

// VPC variables
variable "vpc_name" {
  description = "name of the VPC"
  type        = string
}

variable "cidr_range" {
  description = "CIDR range"
  type        = string
}

variable "public_subnet_1" {
  description = "name of public subnet 1"
  type        = string
}

variable "public_subnet_1_cidr_range" {
  description = "CIDR range of public subnet 1"
  type        = string
}

variable "public_subnet_1_availability_zone" {
  description = "availability zone for public subnet 1"
  type        = string
}

variable "public_subnet_2" {
  description = "name of public subnet 2"
  type        = string
}

variable "public_subnet_2_cidr_range" {
  description = "CIDR range of public subnet 2"
  type        = string
}

variable "public_subnet_2_availability_zone" {
  description = "availability zone for public subnet 2"
  type        = string
}

variable "private_subnet_1" {
  description = "name of private subnet 1"
  type        = string
}

variable "private_subnet_1_cidr_range" {
  description = "CIDR range of private subnet 1"
  type        = string
}

variable "private_subnet_1_availability_zone" {
  description = "availability zone for private subnet 1"
  type        = string
}

variable "private_subnet_2" {
  description = "name of private subnet 2"
  type        = string
}

variable "private_subnet_2_cidr_range" {
  description = "CIDR range of private subnet 2"
  type        = string
}

variable "private_subnet_2_availability_zone" {
  description = "availability zone for private subnet 2"
  type        = string
}

variable "IGW_name" {
  description = "name of internet gateway"
  type        = string
}

variable "public_rt" {
  description = "name of public route table"
  type        = string
}


variable "EIP_name" {
  description = "name of Elastic IP"
  type        = string
}

variable "NAT_gateway_name" {
  description = "name of NAT gateway"
  type        = string
}

variable "private_rt" {
  description = "name of private route table"
  type        = string
}

variable "NACL_name" {
  description = "name of NACL"
  type        = string
}

// CS cluster variables
variable "cluster-name" {
  description = "name of the cluster"
  type        = string
}

variable "nodegroup-name" {
  description = "name of the nodegroup"
  type        = string
}

variable "cluster-role" {
  description = "name of the cluster IAM role"
  type        = string
}

variable "nodegroup-role" {
  description = "name of the nodegroup IAM role"
  type        = string
}

variable "dr-key" {
  description = "name of the key"
  type        = string
}