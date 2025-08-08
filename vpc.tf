resource "aws_vpc" "main" {
  cidr_block = var.vpc_cidr
  tags = merge(local.default_tags, {
    Name = var.vpc_name
  })
}

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.main.id
  tags = merge(local.default_tags, {
    Name = var.igw_name
  })
}

resource "aws_eip" "nat" {
  vpc = true
}

resource "aws_nat_gateway" "nat" {
  allocation_id = aws_eip.nat.id
  subnet_id     = aws_subnet.public.id
  tags = merge(local.default_tags, {
    Name = var.nat_name
  })
  depends_on = [aws_internet_gateway.igw]
}
