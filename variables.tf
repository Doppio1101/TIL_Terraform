variable "aws_region" {
  default = "ap-northeast-2"
}

variable "ec2_ami" {
  # Amazon Linux 2023 AMI ID는 리전마다 다름
  # 2025.08.08 기준 AMI ID(x86)
  default = "ami-0811349cae530179a"
}
# VPC 설정
variable "vpc_name" {
  description = "VPC Name"
  type        = string
  default     = "${local.prefix}_VPC"
}

variable "vpc_cidr" {
  description = "VPC CIDR"
  type        = string
}

# IGW 설정
variable "igw_name" {
  description = "Internet Gateway Name"
  type        = string
  default     = "${local.prefix}_IGW"
}

variable "nat_name" {
  description = "NAT Gateway Name"
  type        = string
  default     = "${local.prefix}_NAT_AZ"
}

variable "public_subnet" {
  description = "List of Public Subnet CIDRs"
  type        = list(object({
    name = string
    cidr = string
    az = string
  }))
}

variable "private_subnet" {
  description = "List of Private Subnet CIDRs"
  type        = list(object({
    name = string
    cidr = string
    az = string
  }))
}

variable "db_subnet" {
  description = "List of DB Subnet CIDRs"
    type        = list(object({
    name = string
    cidr = string
    az = string
  }))
}

variable "public_route_table" {
  description = "Public Routing Table"
  type        = string
}

variable "private_route_table" {
  description = "Private Routing Table"
  type        = string
}

variable "db_route_table" {
  description = "Private Routing Table"
  type        = string
}

variable "public_route" {
  description = "Public Route Config"
  type        = list(object({
    cidr_block = string
    gateway_id = string
  }))
  
}