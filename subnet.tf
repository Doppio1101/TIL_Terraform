resource "aws_subnet" "public_subnet" {
  for_each                = { for s in var.public_subnet : s.name => s }
  vpc_id                  = aws_vpc.vpc.id
  cidr_block              = each.value.cidr
  map_public_ip_on_launch = true
  availability_zone       = each.value.az
  tags = merge(var.default_tags, {
    Name = each.value.name
  })
}

resource "aws_subnet" "private_subnet" {
  for_each                = { for s in var.private_subnet : s.name => s }
  vpc_id                  = aws_vpc.vpc.id
  cidr_block              = each.value.cidr
  map_public_ip_on_launch = false
  availability_zone       = each.value.az
  tags = merge(var.default_tags, {
    Name = each.value.name
  })
}

resource "aws_subnet" "db_subnet" {
  for_each                = { for s in var.db_subnet : s.name => s }
  vpc_id                  = aws_vpc.vpc.id
  cidr_block              = each.value.cidr
  map_public_ip_on_launch = false
  availability_zone       = each.value.az
  tags = merge(var.default_tags, {
    Name = each.value.name
  })
}
