provider "aws"{

  region     = "us-east-1"
  profile    = "default"
}
resource "aws_s3_bucket" "chandra3" {

  bucket = "chandra3-1-s3-bucket"

}

resource "aws_s3_bucket_acl" "example1" {

  bucket = aws_s3_bucket.chandra3.id
  acl    = "private"

}
