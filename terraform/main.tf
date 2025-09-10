resource "aws_s3_bucket" "sensitive_data_bucket" {
  bucket = "my-public-sensitive-data-bucket-12345"

  acl    = "public-read"

  versioning {
    enabled = true
  }

  tags = {
    Environment = "Dev"
    Project     = "Merlin3"
  }
}

resource "aws_s3_bucket_public_access_block" "block_public_access" {
  bucket = aws_s3_bucket.sensitive_data_bucket.id

  block_public_acls       = false
  ignore_public_acls      = false
  block_public_policy     = false
  restrict_public_buckets = false
}
