terraform {
  backend "s3" {
    bucket         = "nanomedia-tfstate-955157070576-task01"
    key            = "assignment/terraform.tfstate"
    region         = "eu-north-1"
    dynamodb_table = "terraform-state-locks"
    encrypt        = true
  }
}

