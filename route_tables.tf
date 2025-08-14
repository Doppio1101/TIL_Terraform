resource "aws_route_table" "public_route_table" {
  vpc_id = aws_vpc.vpc.id

  tags = merge(local.default_tags, {
    Name = var.public_route_name
  })
}

resource "aws_route" "public_route" {
  route_table_id = aws_route_table.public_route_table.id

  for_each = { for s in var.public_route : s.cidr_block => s}
  destination_cidr_block = each.value.cidr_block
  gateway_id = each.value.gateway_id

}

resource "aws_route_table_association" "public" {
  for_each       = aws_subnet.public_subnet
  subnet_id      = each.value.id
  route_table_id = aws_route_table.public_route_table.id
}

resource "aws_route_table" "private_route_table" {
  vpc_id         = aws_vpc.vpc.id
  
  tags = merge(local.default_tags, {
    Name = var.private_route_name
  })
}

resource "aws_route" "private_route" {
  route_table_id = aws_route_table.private_route_table.id

  for_each = { for s in var.private_route : s.cidr_block => s}
  destination_cidr_block = each.value.cidr_block
  gateway_id = each.value.gateway_id
  
}

resource "aws_route_table_association" "private" {
  for_each       = aws_subnet.private_subnet
  subnet_id      = each.value.id
  route_table_id = aws_route_table.private_route_table.id
}

resource "aws_route_table" "db_route_table" {
  vpc_id         = aws_vpc.vpc.id

  tags = merge(local.default_tags, {
    Name = var.db_route_name
  })
}

resource "aws_route" "db_route" {
  route_table_id = aws_route_table.db_route_table.id

  for_each = {for s in var.db_route : s.cidr_block => s}
  destination_cidr_block = each.value.cidr_block
  gateway_id = each.value.gateway_id
  
}

resource "aws_route_table_association" "db" {
  for_each       = aws_subnet.db_subnet
  subnet_id      = each.value.id
  route_table_id = aws_route_table.db_route_table.id
}