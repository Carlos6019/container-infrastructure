terraform {
  backend "s3" {
    bucket = "wordpress-site"
    key    = "wordpress/terraform.tfstate"
    region = "us-east-1"
  }
}
