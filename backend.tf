terraform {
  backend "cos" {
    bucket = "nano-tfstate-43253514"
    region = "ap-tokyo"
    key    = "test.tfstate"
  }
}
