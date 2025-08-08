# Terraform 기반 AWS 베이직 아키텍처 구성

## 1. 요구사항

### Default Tags
- "Corp" = "JHCorp"
- "Operation_Team" = "CloudOpsTeam"

### VPC
- 총 수량 : 1ea
1. JHCorp_Dev_VPC_10_225_0_CIDR22
- Name : JHCorp_Dev_VPC_10_225_0_CIDR22
- CIDR : 10.225.0.0/22

### Internet Gateway
- 총 수량 : 1ea
- Name : JHCorp_Dev_IGW
- 연결 VPC : JHCorp_Dev_VPC_10_225_0_CIDR22

### NAT Gateway
- 총 수량 : 1ea
- Name : JHCorp_Dev_NAT_AZ
- 연결 서브넷 : JHCorp_Dev_Subnet_PU_AZ

### Subnet
- 총 수량 : 6ea
- 연결 VPC : JHCorp_Dev_VPC_10_225_0_CIDR22
1. JHCorp_Dev_Subnet_PU_AZ
- Name : JHCorp_Dev_Subnet_PU_AZ
- CIDR : 10.225.0.0/25
2. JHCorp_Dev_Subnet_PU_CZ
- Name : JHCorp_Dev_Subnet_PU_CZ
- CIDR : 10.225.0.128/25
3. JHCorp_Dev_Subnet_PR_AZ
- Name : JHCorp_Dev_Subnet_PR_AZ
- CIDR : 10.225.1.0/24
4. JHCorp_Dev_Subnet_PR_CZ
- Name : JHCorp_Dev_Subnet_PR_CZ
- CIDR : 10.225.2.0/24
5. JHCorp_Dev_Subnet_DB_AZ
- Name : JHCorp_Dev_Subnet_DB_AZ
- CIDR : 10.225.3.0/25
6. JHCorp_Dev_Subnet_DB_CZ
- Name : JHCorp_Dev_Subnet_DB_CZ
- CIDR : 10.225.3.128/25

### Routing Table
- 총 수량 : 3ea
1. JHCorp_Dev_RT_PU
- Name : JHCorp_Dev_RT_PU
- 명시적 서브넷 연결 : JHCorp_Dev_Subnet_PU_AZ, JHCorp_Dev_Subnet_PU_CZ
- 라우팅 설정 : 0.0.0.0/0 - JHCorp_Dev_IGW
2. JHCorp_Dev_RT_PR
- Name : JHCorp_Dev_RT_PR
- 명시적 서브넷 연결 : JHCorp_Dev_Subnet_PR_AZ, JHCorp_Dev_Subnet_PR_CZ
- 라우팅 설정 : 0.0.0.0/0 - JHCorp_Dev_NAT_AZ
3. JHCorp_Dev_RT_DB
- Name : JHCorp_Dev_RT_DB
- 명시적 서브넷 연결 : JHCorp_Dev_Subnet_DB_AZ, JHCorp_Dev_Subnet_DB_CZ

### EC2
- 총 수량 : 1ea
1. JHCorpdev01
- Name : JHCorpdev01
- OS 이미지 : Amazon Linux 2023
- 인스턴스 타입 : t3.micro
- Key pairs : JHCorpdev01.pem(RSA)
- 연결 VPC : JHCorp_Dev_VPC_10_225_0_CIDR22
- 연결 서브넷 : JHCorp_Dev_Subnet_PU_AZ
- Public IP : 활성화
- 기본 IP : 10.225.0.10
- 연결 Security Group : JHCorp_Dev_In_SG_JHCorpdev01_Temp
- 스토리지 구성 : 10GiB(gp3), 20GiB(gp3)
- 사용자 데이터 : ./JHCorp_Linux_Set.sh 파일 참조

### Security Group
- 총 수량 : 1ea
1. JHCorp_Dev_In_SG_JHCorpdev01_Temp
- Name : JHCorp_Dev_In_SG_JHCorpdev01_Temp
- 인바운드 규칙
  a. Description : From Office 2F to SSH_20250807
     - 유형 : SSH
     - 포트 범위 : 22
     - 소스 : 218.233.5.253/32
  b. Description : From Internet to HTTP_20250807
     - 유형 : HTTP
     - 포트 범위 : 80
     - 소스 : 0.0.0.0/0
  c. Description : From Internet to HTTPS_20250807
     - 유형 : HTTPS
     - 포트 범위 : 443
     - 소스 : 0.0.0.0/0
- 아웃바운드 규칙
  a. Description : From JHCorpdev01 to Internet_20250807
     - 유형 : 모든트래픽
     - 포트 범위 : 전체
     - 소스 : 0.0.0.0/0