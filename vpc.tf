resource "aws_vpc" "vpc" {
  cidr_block = var.vpc_cidr
  tags = merge(var.default_tags, {
    Name = var.vpc_name
  })
}

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.vpc.id
  tags = merge(var.default_tags, {
    Name = var.igw_name
  })
}

resource "aws_eip" "nat" {
  domain = "vpc"
}

resource "aws_nat_gateway" "nat" {
  allocation_id = aws_eip.nat.id
  # subnet_id     = aws_subnet.public_subnet.id
  subnet_id     = aws_subnet.public_subnet["JHCorp_Stg_Subnet_PU_AZ"].id
  tags = merge(var.default_tags, {
    Name = var.nat_name
  })
  depends_on = [aws_internet_gateway.igw]
}
