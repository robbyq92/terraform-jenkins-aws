resource "aws_vpc" "main_vpc" {
  cidr_block           = var.vpc_cidr
  enable_dns_hostnames = true
  tags = {
    Name = "terraform-aws-vpc-rcm"
  }
}

resource "aws_eip" "nat" {
  instance = aws_instance.nat.id
  vpc      = true
}

resource "aws_eip" "web-1" {
  instance = aws_instance.web-1.id
  vpc      = true
}

resource "aws_route_table" "ap-northeast-2a-public" {
  vpc_id = aws_vpc.main_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.ig-main.id
  }

  tags = {
    Name = "Public Subnet"
  }
}

resource "aws_route_table_association" "ap-northeast-2a-public" {
  subnet_id      = aws_subnet.ap-northeast-2a-public.id
  route_table_id = aws_route_table.ap-northeast-2a-public.id
}

resource "aws_route_table" "ap-northeast-2b-private" {
  vpc_id = aws_vpc.main_vpc.id

  route {
    cidr_block  = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.ig-main.id
  }

  tags = {
    Name = "Private Subnet"
  }
}

resource "aws_route_table_association" "ap-northeast-2b-private" {
  subnet_id      = aws_subnet.ap-northeast-2b-private.id
  route_table_id = aws_route_table.ap-northeast-2b-private.id
}

resource "aws_subnet" "ap-northeast-2a-public" {
  vpc_id = aws_vpc.main_vpc.id

  cidr_block        = var.public_subnet_cidr
  availability_zone = "ap-northeast-2a"

  tags = {
    Name = "Public Subnet"
  }
}

resource "aws_subnet" "ap-northeast-2b-private" {
  vpc_id = aws_vpc.main_vpc.id

  cidr_block        = var.private_subnet_cidr
  availability_zone = "ap-northeast-2b"

  tags = {
    Name = "Private Subnet"
  }
}

resource "aws_internet_gateway" "ig-main" {
  vpc_id = aws_vpc.main_vpc.id
}

