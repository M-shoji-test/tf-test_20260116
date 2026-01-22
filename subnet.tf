resource "aws_subnet" "public_a"  { 
  vpc_id 	    = aws_vpc.main.id 
  cidr_block	    = "10.0.0.0/20"
  availability_zone = "eu-north-1a"
 
  # 今 mappub が False なのでfalse
  map_public_ip_on_launch = false

  tags = {
    Name = "vpc-test2025-1224-subnet-public1-eu-north-1a"
  }
}

resource "aws_subnet" "public_b"  {
  vpc_id           = aws_vpc.main.id 
  cidr_block       = "10.0.16.0/20"
  availability_zone = "eu-north-1b"
  map_public_ip_on_launch = false

  tags = {
    Name = "vpc-test2025-1224-subnet-public2-eu-north-1b"
  }
}

resource "aws_subnet" "private_a" {
  vpc_id = aws_vpc.main.id 
  cidr_block        = "10.0.128.0/20"
  availability_zone = "eu-north-1a"
  map_public_ip_on_launch = false

  tags = {
    Name = "vpc-test2025-1224-subnet-private1-eu-north-1a"
  }
}

resource "aws_subnet" "private_b" {
  vpc_id = aws_vpc.main.id 
  cidr_block        = "10.0.144.0/20"
  availability_zone = "eu-north-1b"
  map_public_ip_on_launch = false

  tags = {
    Name = "vpc-test2025-1224-subnet-private2-eu-north-1b"
  }
}

