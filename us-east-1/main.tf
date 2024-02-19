
resource "aws_s3_bucket" "preproduseastbuc" {
  bucket = "preproduseastbuc"

  tags = {
    Name        = "preproduseastbuc"
    Environment = "preprod"
  }
}

resource "aws_s3_bucket_versioning" "preproduseastbucvers" {
  bucket = aws_s3_bucket.preproduseastbuc.id
  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_dynamodb_table" "preproduseastdyndbtable" {
  name           = "preproduseastdyndbtable"
  billing_mode   = "PROVISIONED"
  read_capacity  = 20
  write_capacity = 20
  hash_key       = "LockId"


  attribute {
    name = "LockId"
    type = "S"
  }
}