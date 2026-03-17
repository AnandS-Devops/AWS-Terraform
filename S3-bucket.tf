resource "aws_s3_bucket" "my_demo_S3bucket" {
  bucket = "my-demo-s3bucket-terraform"

  tags = {
    Name        = "My demo S3 bucket"
    Environment = "Dev"
  }
}