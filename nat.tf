resource "aws_nat_gateway" "nat" {
  allocation_id = "eipalloc-04a6e153de435758a"
  subnet_id     = "subnet-0bea03c8892a85559"

  tags = {
    Name = "vpc-test2025-1224-nat"
  }
}
