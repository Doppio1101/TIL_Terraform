
prefix = "JHCorp"
env = "Stg"



vpc_name = "JHCorp_Stg_VPC_10_224_0_CIDR22"
vpc_cidr = "10.224.0.0/22"
igw_name = "JHCorp_Stg_IGW"
nat_name = "JHCorp_Stg_NAT_AZ"
public_subnet = [
  {
    name = "JHCorp_Stg_Subnet_PU_AZ"
    cidr = "10.224.0.0/25"
    az = "ap-northeast-2a"
  }, 
  {
    name = "JHCorp_Stg_Subnet_PU_CZ"
    cidr = "10.224.0.128/25"
    az = "ap-northeast-2c"
  }

]
private_subnet = [
  {
    name = "JHCorp_Stg_Subnet_PR_AZ"
    cidr = "10.224.1.0/24"
    az = "ap-northeast-2a"
  }, 
  {
    name = "JHCorp_Stg_Subnet_PR_CZ"
    cidr = "10.224.2.0/24"
    az = "ap-northeast-2c"
  }

]
db_subnet = [
  {
    name = "JHCorp_Stg_Subnet_DB_AZ"
    cidr = "10.224.3.0/25"
    az = "ap-northeast-2a"
  }, 
  {
    name = "JHCorp_Stg_Subnet_DB_CZ"
    cidr = "10.224.3.128/25"
    az = "ap-northeast-2c"
  }

]

public_route_name = "JHCorp_Stg_RT_PU"
private_route_name = "JHCorp_Stg_RT_PR"
db_route_name = "JHCorp_Stg_RT_DB"

public_route = []
private_route = []
db_route = []


# public_route = [ {
#   cidr_block = "0.0.0.0/0"
#   gateway_id = aws_internet_gateway.igw.id
# }]

# private_route = [ {
#   cidr_block = "0.0.0.0/0"
#   gateway_id = aws_nat_gateway.nat.id
# } ]

# db_route = [ {
#   cidr_block = "0.0.0.0/0"
#   gateway_id = aws_nat_gateway.nat.id
# } ]