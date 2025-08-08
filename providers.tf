# AWS provider 및 설정 파일
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 5.0"
    }
  }

  # 현재는 로컬 상태 파일 사용
  backend "local" {
    path = "./terraform.tfstate"
  }

  # 추후 S3 backend 사용 시, AWS S3 버킷 생성 후 아래 주석 해제하여 형상관리 진행 
  # backend "s3" {
  #   bucket         = "jhcorp-terraform-backend"
  #   key            = "dev/network/terraform.tfstate"
  #   region         = "ap-northeast-2"
  #   dynamodb_table = "terraform-lock"
  #   encrypt        = true
  # }
}

provider "aws" {
  region = var.aws_region
}