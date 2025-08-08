vpc_name = "${local.prefix}_Dev_VPC_10_225_0_CIDR22"
vpc_cidr = "10.225.0.0/22"
igw_name = "${local.prefix}_Dev_IGW"
nat_name = "${local.prefix}_Dev_NAT_AZ"
public_subnet = [
  {
    name = "${local.prefix}_Dev_Subnet_PU_AZ"
    cidr = "10.225.0.0/25"
  }, 
  {
    name = "${local.prefix}_Dev_Subnet_PU_CZ"
    cidr = "10.225.0.128/25"
  }

]
private_subnet = [
  {
    name = "${local.prefix}_Dev_Subnet_PR_AZ"
    cidr = "10.225.1.0/24"
  }, 
  {
    name = "${local.prefix}_Dev_Subnet_PR_CZ"
    cidr = "10.225.2.0/24"
  }

]
db_subnet = [
  {
    name = "${local.prefix}_Dev_Subnet_DB_AZ"
    cidr = "10.225.3.0/25"
  }, 
  {
    name = "${local.prefix}_Dev_Subnet_DB_CZ"
    cidr = "10.225.3.128/25"
  }

]
public_route_table = "${local.prefix}_Dev_RT_PU"
private_route_table = "${local.prefix}_Dev_RT_PR"
db_route_table = "${local.prefix}_Dev_RT_DB"