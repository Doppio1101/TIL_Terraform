resource "aws_subnet" "public" {
  for_each                = { for s in var.public_subnet : s.name => s }
  vpc_id                  = aws_vpc.main.id
  cidr_block              = each.value.cidr
  map_public_ip_on_launch = true
  availability_zone       = each.value.az
  tags = merge(local.default_tags, {
    Name = each.value.name
  })
}

resource "aws_subnet" "private" {
  for_each                = { for s in var.private_subnet : s.name => s }
  vpc_id                  = aws_vpc.main.id
  cidr_block              = each.value.cidr
  map_public_ip_on_launch = false
  availability_zone       = each.value.az
  tags = merge(local.default_tags, {
    Name = each.value.name
  })
}

resource "aws_subnet" "db" {
  for_each                = { for s in var.db_subnet : s.name => s }
  vpc_id                  = aws_vpc.main.id
  cidr_block              = each.value.cidr
  map_public_ip_on_launch = false
  availability_zone       = each.value.az
  tags = merge(local.default_tags, {
    Name = each.value.name
  })
}
