resource "aws_vpc" "VPC" {
  cidr_block = var.cidr_block
  tags = {
    Name = "VPC"
    app  = "3tier-application"
  }

}

resource "aws_subnet" "subnetPublic1" {
  vpc_id                  = aws_vpc.VPC.id
  cidr_block              = var.subnet_block_public1
  availability_zone       = var.availability_zone_public_1
  map_public_ip_on_launch = true
  tags = {
    Name = "Subnet"
    app  = "3tier-application"
  }
}
resource "aws_subnet" "subnetPublic2" {
  vpc_id                  = aws_vpc.VPC.id
  cidr_block              = var.subnet_block_public2
  availability_zone       = var.availability_zone_public_2
  map_public_ip_on_launch = true
  tags = {
    Name = "Subnet"
    app  = "3tier-application"
  }
}
resource "aws_route" "publicRoute" {
  route_table_id         = aws_route_table.publicRouteTable.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.igw.id
}

resource "aws_route_table_association" "public_assoc1" {
  subnet_id      = aws_subnet.subnetPublic1.id
  route_table_id = aws_route_table.publicRouteTable.id
}
resource "aws_route_table_association" "public_assoc2" {
  subnet_id      = aws_subnet.subnetPublic2.id
  route_table_id = aws_route_table.publicRouteTable.id
}

resource "aws_route_table" "publicRouteTable" {
  vpc_id = aws_vpc.VPC.id
  tags = {
    Name = "PublicRouteTable"
    app  = "3tier-application"
  }
}

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.VPC.id
  tags = {
    Name = "InternetGateway"
    app  = "3tier-application"
  }
}

resource "aws_subnet" "subnetPrivate1" {
  vpc_id            = aws_vpc.VPC.id
  cidr_block        = var.subnet_block_private1
  availability_zone = var.availability_zone_private_1
  tags = {
    Name = "Subnet"
    app  = "3tier-application"
  }
}
resource "aws_subnet" "subnetPrivate2" {
  vpc_id            = aws_vpc.VPC.id
  cidr_block        = var.subnet_block_private2
  availability_zone = var.availability_zone_private_2
  tags = {
    Name = "Subnet"
    app  = "3tier-application"
  }
}

resource "aws_route" "privateRoute" {
  route_table_id         = aws_route_table.privateRouteTable.id
  destination_cidr_block = "0.0.0.0/0"
  nat_gateway_id         = aws_nat_gateway.natgw.id
}
resource "aws_route_table" "privateRouteTable" {
  vpc_id = aws_vpc.VPC.id
  tags = {
    Name = "PrivateRouteTable"
    app  = "3tier-application"
  }
}
resource "aws_route_table_association" "private_assoc1" {
  subnet_id      = aws_subnet.subnetPrivate1.id
  route_table_id = aws_route_table.privateRouteTable.id
}
resource "aws_route_table_association" "private_assoc2" {
  subnet_id      = aws_subnet.subnetPrivate2.id
  route_table_id = aws_route_table.privateRouteTable.id
} 

resource "aws_nat_gateway" "natgw" {
  allocation_id = aws_eip.nat_eip.id
  subnet_id     = aws_subnet.subnetPublic1.id
  depends_on = [aws_internet_gateway.igw]
  tags = {
    Name = "NATGateway"
    app  = "3tier-application"
  }
}
resource "aws_eip" "nat_eip" {
  domain = "vpc"
  tags = {
    Name = "NATGatewayEIP"
    app  = "3tier-application"
  }
}

