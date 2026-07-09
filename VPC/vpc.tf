#virtual private cloud
resource "aws_vpc" "main" {
  cidr_block           = var.vpc_cidr
  enable_dns_hostnames = true  # A boolean flag to enable/disable DNS hostnames in the VPC. Defaults false.
  enable_dns_support   = true  # A boolean flag to enable/disable DNS support in the VPC. Defaults to true.

  tags = {
    Name = "${var.project}-vpc"
  }
}

#Internet Gateway
resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "${var.project}-igw"
  }
}

# Public Subnets [2]
resource "aws_subnet" "public_1" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = "10.0.1.0/24"
  availability_zone       = "us-east-1a"
  map_public_ip_on_launch = true

  tags = {
    Name = "public-subnet-1"
  }
}

resource "aws_subnet" "public_2"{
    vpc_id              = aws_vpc.main.id
    cidr_block          = "10.0.2.0/24"
    availability_zone   = "us-east-1b"
    map_public_ip_on_launch = true

    tags = {
        Name = "public-subnet-2"
    }
}

# private subnet [2]
resource "aws_subnet" "private_app_1" {

  vpc_id            = aws_vpc.main.id
  cidr_block        = "10.0.11.0/24"
  availability_zone = "us-east-1a"

  tags = {
    Name = "private-app-1"
  }
}

resource "aws_subnet" "private_app_2"{

    vpc_id          = aws_vpc.main.id
    cidr_block      = "10.0.12.0/24"
    availability_zone = "us-east-1b"

    tags = {
        Name = "private-app-2"
    }
}

# private db subnet [2]

resource "aws_subnet" "privte_db_1"{
    vpc_id          = aws_vpc.main.id
    cidr_block      = "10.0.21.0/24"
    availability_zone = "us-east-1a"

    tags = {
        Name = "private-db-1"
    }
}

resource "aws_subnet" "private_db_2"{
    vpc_id          = aws_vpc.main.id
    cidr_block      = "10.0.22.0/24"
    availability_zone = "us-east-1b"

    tags ={
        Name = "private-db-2"
    }
}

# route table
resource "aws_route_table" "public"{
    vpc_id      = aws_vpc.main.id

    route {
        cidr_block      = "0.0.0.0/0"
        gateway_id      = aws_internet_gateway.igw.id
    }

    tags = {
        Name  = "public-route-table"
    }
}

#aws route table association
resource "aws_route_table_association" "public1"{
    subnet_id      = aws_subnet.public_1.id
    route_table_id = aws_route_table.public.id
}

resource "aws_route_table_association" "public2"{
    subnet_id       = aws_subnet.public_2.id
    route_table_id  = aws_route_table.public.id
}

#security group
resource "aws_security_group" "web" {

  name   = "web-sg"
  vpc_id = aws_vpc.main.id

  ingress {

    from_port = var.from_port_1
    to_port   = var.to_port_1
    protocol  = "tcp"

    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {

    from_port = var.from_port_2
    to_port   = var.to_port_2
    protocol  = "tcp"

    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {

    from_port = 0
    to_port   = 0
    protocol  = "-1"

    cidr_blocks = ["0.0.0.0/0"]
  }
}