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

