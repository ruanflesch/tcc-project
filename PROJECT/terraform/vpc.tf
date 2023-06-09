resource "aws_vpc" "tcc-project" {
  cidr_block           = "10.0.0.0/16"
  instance_tenancy     = "default"
  enable_dns_support   = "true"
  enable_dns_hostnames = "true"

  tags = {
    Name = "tcc-VPC"
  }
}

resource "aws_subnet" "tcc-pub-1" {
  vpc_id                  = aws_vpc.tcc-project.id
  cidr_block              = "10.0.1.0/24"
  map_public_ip_on_launch = "true"
  availability_zone       = var.ZONE1

  tags = {
    Name = "tcc-pub-1"
  }
}

resource "aws_subnet" "tcc-pub-2" {
  vpc_id                  = aws_vpc.tcc-project.id
  cidr_block              = "10.0.2.0/24"
  map_public_ip_on_launch = "true"
  availability_zone       = var.ZONE2

  tags = {
    Name = "tcc-pub-1"
  }
}

resource "aws_internet_gateway" "tcc-IGW" {
  vpc_id = aws_vpc.tcc-project.id

  tags = {
    Name = "tcc-IGW"
  }
}

resource "aws_route_table" "tcc-pub-RT" {
  vpc_id = aws_vpc.tcc-project.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.tcc-IGW.id
  }

  tags = {
    Name = "tcc-pub-RT"
  }
}

resource "aws_route_table_association" "tcc-pub-1-a" {
  subnet_id      = aws_subnet.tcc-pub-1.id
  route_table_id = aws_route_table.tcc-pub-RT.id
}