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

#resource "aws_instance" "db" {
#  ami                    = "ami-0677aa126dc453424"
#  instance_type          = "t3.micro"
#  subnet_id              = aws_subnet.private_a.id
#  key_name               = "2026-0105-test"
#  vpc_security_group_ids = [aws_security_group.db.id]
#
#  tags = { Name = "WP-test-db" }
#
#  lifecycle {
#    ignore_changes = [
#      ami,
#      user_data,
#      user_data_replace_on_change,
#      root_block_device,
#      metadata_options,
#      credit_specification
#    ]
#  }
#}

resource "aws_instance" "bk" {
  ami                    = "ami-0c83cb1c664994bbd"
  instance_type          = "t3.micro"
  subnet_id              = aws_subnet.private_b.id
  key_name               = "2026-0105-test"
  vpc_security_group_ids = [aws_security_group.bk.id]

  tags = { Name = "WP-test-bk" }

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

resource "aws_db_instance" "wordpress" {
  identifier = "database-test-sj"

  engine         = "mysql"
  instance_class = "db.m7g.large"

  allocated_storage     = 20
  max_allocated_storage = 1000
  storage_type          = "gp2"
  storage_encrypted     = true

  username = "admin"
  password = var.db_password

  port                          = 3306
  multi_az                      = true
  publicly_accessible           = false
  backup_retention_period       = 7
  monitoring_interval           = 60
  performance_insights_enabled  = true
  copy_tags_to_snapshot         = true
  skip_final_snapshot           = true

  db_subnet_group_name   = aws_db_subnet_group.rds_private.name
  vpc_security_group_ids = [aws_security_group.db_sg.id]

  lifecycle {
    ignore_changes = [password]
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
  allocation_id = aws_eip.al2023.allocation_id
}

# （任意）出力しておくと便利
output "al2023_eip" {
  value = aws_eip.al2023.public_ip
}

