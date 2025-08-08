# Provider 설정
provider "AWS" {
    region = "ap-northeast-2"
    default_tags {
        tags = {
            Corp = "JHCorp"
            Operation_Team = "CloudOpsTeam"
        }
    }
}

# VPC 설정
# VPC 구분 : Com, Dev, Stg, Prd
# AWS Organizations 구성 시, Com이 없어질 수 있으며 각 VPC를 배포하는 Account가 달라질 수 있음.
# 해당 예제에서는 Dev 영역만 만들어 진행하고자 함.
# Com : 공용 VPC로 Internet과 연결되는 Public Subnet 2개와 Git 등 공용 리소스를 두는 Private Subnet 2개로 구성.
# Dev : 개발 VPC로 Internet은 차단되며, Private Subnet 4개로 구성되어 2개는 APP(WEB,WAS,EKS 등)으로 구성, 2개는 DB로 구성
# Stg : 검증 VPC로 Internet은 차단되며, Private Subnet 4개로 구성되어 2개는 APP(WEB,WAS,EKS 등)으로 구성, 2개는 DB로 구성
# Prd : 운영 VPC로 Internet은 차단되며, Private Subnet 4개로 구성되어 2개는 APP(WEB,WAS,EKS 등)으로 구성, 2개는 DB로 구성
resource "aws_vpc" "JHCorp_Dev_VPC_10_225_0_CIDR24" {
    cidr_block = "10.225.0.0/24"
    
}