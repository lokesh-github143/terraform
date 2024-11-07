// create VPC

resource "aws_vpc" "vpc" {
  cidr_block       = var.cidr_range
  instance_tenancy = "default"
  enable_dns_hostnames = true
  enable_dns_support = true
  

  tags = {
    Name = var.vpc_name,
    env = var.env,
    prj = var.prj,
    cst = var.cst,
    owner = var.owner
  }
}

// create public subnet - 1

resource "aws_subnet" "public_subnet_1" {
  vpc_id     = aws_vpc.vpc.id
  cidr_block = var.public_subnet_1_cidr_range
  availability_zone = var.public_subnet_1_availability_zone

  tags = {
    Name = var.public_subnet_1,
    env = var.env,
    prj = var.prj,
    cst = var.cst,
    owner = var.owner
  }
}

// create public subnet - 2

resource "aws_subnet" "public_subnet_2" {
  vpc_id     = aws_vpc.vpc.id
  cidr_block = var.public_subnet_2_cidr_range
  availability_zone = var.public_subnet_2_availability_zone

  tags = {
    Name = var.public_subnet_2,
    env = var.env,
    prj = var.prj,
    cst = var.cst,
    owner = var.owner
  }
}

// create private subnet - 1

resource "aws_subnet" "private_subnet_1" {
  vpc_id     = aws_vpc.vpc.id
  cidr_block = var.private_subnet_1_cidr_range
  availability_zone = var.private_subnet_1_availability_zone

  tags = {
    Name = var.private_subnet_1,
   env = var.env,
    prj = var.prj,
    cst = var.cst,
    owner = var.owner
  }
}

// create private subnet - 2

resource "aws_subnet" "private_subnet_2" {
  vpc_id     = aws_vpc.vpc.id
  cidr_block = var.private_subnet_2_cidr_range 
  availability_zone = var.private_subnet_2_availability_zone

  tags = {
    Name = var.private_subnet_2,
    env = var.env,
    prj = var.prj,
    cst = var.cst,
    owner = var.owner
  }
}

// create internet gateway

resource "aws_internet_gateway" "IGW" {
  vpc_id = aws_vpc.vpc.id

  tags = {
    Name = var.IGW_name,
    env = var.env,
    prj = var.prj,
    cst = var.cst,
    owner = var.owner
  }
}

// create public route table

resource "aws_route_table" "public_rt" {
  vpc_id = aws_vpc.vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.IGW.id
  }

  

  tags = {
    Name = var.public_rt,
    env = var.env,
    prj = var.prj,
    cst = var.cst,
    owner = var.owner
  }
}

// subnet association in public route table

resource "aws_route_table_association" "subnet_association_1_in_public_rt" {
  subnet_id      = aws_subnet.public_subnet_1.id
  route_table_id = aws_route_table.public_rt.id
}

resource "aws_route_table_association" "subnet_association_2_in_public_rt" {
  subnet_id      = aws_subnet.public_subnet_2.id
  route_table_id = aws_route_table.public_rt.id
}

resource "aws_main_route_table_association" "main_rt_assoc" {
  vpc_id         = aws_vpc.vpc.id
  route_table_id = aws_route_table.public_rt.id
}

// create Elastic IP for NAT gateway

resource "aws_eip" "EIP" {
  domain   = "vpc"

  tags = {
    Name = var.EIP_name,
    env = var.env,
    prj = var.prj,
    cst = var.cst,
    owner = var.owner
  }
}

// create NAT gateway

resource "aws_nat_gateway" "NAT_gateway" {
  allocation_id = aws_eip.EIP.id
  subnet_id     = aws_subnet.public_subnet_1.id

  tags = {
    Name = var.NAT_gateway_name,
    env = var.env,
    prj = var.prj,
    cst = var.cst,
    owner = var.owner
  }
}

// create private route table

resource "aws_route_table" "private_rt" {
  vpc_id = aws_vpc.vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_nat_gateway.NAT_gateway.id
  }

  tags = {
    Name = var.private_rt,
    env = var.env,
    prj = var.prj,
    cst = var.cst,
    owner = var.owner
  }
} 

// subnet association in private route table

resource "aws_route_table_association" "subnet_association_1_in_private_rt" {
  subnet_id      = aws_subnet.private_subnet_1.id
  route_table_id = aws_route_table.private_rt.id
}

resource "aws_route_table_association" "subnet_association_2_in_private_rt" {
  subnet_id      = aws_subnet.private_subnet_2.id
  route_table_id = aws_route_table.private_rt.id
}

// Network acl

resource "aws_network_acl" "main" {
  vpc_id = aws_vpc.vpc.id
  subnet_ids = [aws_subnet.private_subnet_2.id,aws_subnet.private_subnet_1.id,aws_subnet.public_subnet_2.id,aws_subnet.public_subnet_1.id]
  
  tags = {
    Name = var.NACL_name,
    env = var.env,
    prj = var.prj,
    cst = var.cst,
    owner = var.owner
  }

// Inbound rules
  ingress {
    protocol   = "-1"  # All protocols
    rule_no    = 100   # Rule number, must be unique and in sequence
    action     = "allow"
    cidr_block = "0.0.0.0/0"

    // Allow all ports
    from_port   = 0
    to_port     = 0
  }

  // Outbound rules
  egress {
    protocol   = "-1"  # All protocols
    rule_no    = 100   # Rule number, must be unique and in sequence
    action     = "allow"
    cidr_block = "0.0.0.0/0"

    // Allow all ports
    from_port   = 0
    to_port     = 0
  }
}






 






