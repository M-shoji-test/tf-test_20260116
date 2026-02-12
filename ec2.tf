resource "aws_instance" "al2023" {
  ami           = "ami-0683ee28af6610487" # ← describe-instances の ImageId
  instance_type = "t3.micro"              # ← 実値
  subnet_id     = aws_subnet.public_a.id  # ← 実値に合わせる
  key_name      = "2026-0105-test"        # ← 実値

  vpc_security_group_ids = [
    aws_security_group.web.id
  ]

  tags = {
    Name = "tf-test_20260116"
  }

  lifecycle {
    ignore_changes = [
      ami,
      user_data,
      user_data_replace_on_change,
      root_block_device,
      metadata_options,
      credit_specification
    ]
  }
}

# Elastic IP を確保
resource "aws_eip" "al2023" {
  domain = "vpc"

  tags = {
    Name = "tf-test_20260116-eip"
  }
}

# その EIP を EC2 に関連付け
resource "aws_eip_association" "al2023" {
  instance_id   = aws_instance.al2023.id
  allocation_id = aws_eip.al2023.id
}

# （任意）出力しておくと便利
output "al2023_eip" {
  value = aws_eip.al2023.public_ip
}

