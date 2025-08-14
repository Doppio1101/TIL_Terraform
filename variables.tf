variable "prefix" {
  description = "Affiliate Prefix"
  type = string
  default = "JHCorp"
}

variable "Env" {
  description = "Environment (e.g., Dev, Stg, Prd)"
  type = string
  default = "Dev"
}

variable "default_tags" {
  description = "default tags"
  type = object({
    # 계열사 구분
    Corp = string
    # 서비스 운영팀
    Operation_Team = string
    # 서비스 구분
    Env = string
  })
  default = {
    Corp = "JHCorp"
    Operation_Team = "JHCorpDevOpsTeam"
    Env = "Dev"
  }
}

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
  default     = "JHCorp_Dev_VPC"
}

variable "vpc_cidr" {
  description = "VPC CIDR"
  type        = string
}

# IGW 설정
variable "igw_name" {
  description = "Internet Gateway Name"
  type        = string
  default     = "JHCorp_Dev_IGW"
}

variable "nat_name" {
  description = "NAT Gateway Name"
  type        = string
  default     = "JHCorp_Dev_NAT_AZ"
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

# variable "public_route_table" {
#   description = "Public Routing Table"
#   type        = string
# }

# variable "private_route_table" {
#   description = "Private Routing Table"
#   type        = string
# }

# variable "db_route_table" {
#   description = "Private Routing Table"
#   type        = string
# }

variable "public_route_name" {
  description = "Public Route Table Name"
  type = string
  default = "JHCorp_Dev_RT_PU"
}

variable "public_route" {
  description = "Public Route Config"
  type        = list(object({
    cidr_block = string
    gateway_id = string
  }))
  default = []
  # defualt 값에서 아직 생성되지 않은 아이디를 가져올 수 없음
  # default = [ {
  #   cidr_block = "0.0.0.0/0"
  #   gateway_id = aws_internet_gateway.igw.id
  # } ]
}

variable "private_route_name" {
  description = "Private Route Table Name"
  type = string
  default = "JHCorp_Dev_RT_PR"
}

variable "private_route" {
  description = "Private Route Config"
  type        = list(object({  
    cidr_block = string
    gateway_id = string
  }))
  default = []
  # defualt 값에서 아직 생성되지 않은 아이디를 가져올 수 없음
  # default = [ {
  #   cidr_block = "0.0.0.0/0"
  #   gateway_id = aws_nat_gateway.nat.id
  # } ]
}

variable "db_route_name" {
  description = "DB Route Table Name"
  type = string
  default = "JHCorp_Dev_RT_DB"
}

variable "db_route" {
  description = "DB Route Config"
  type        = list(object({
    cidr_block = string
    gateway_id = string
  }))
  default = []
}