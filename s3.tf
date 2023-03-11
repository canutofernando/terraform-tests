resource "aws_s3_bucket" "s3-first-bucket" {
  bucket = "${var.bucket-name}"
  tags = var.tags
  }

resource "aws_s3_object" "upload-glue-script" {
  bucket = "${aws_s3_bucket.s3-first-bucket.bucket}"
  key = "Scripts/${var.file-name}"
  tags = var.tags
  source = "${var.file-name}"
  }
  
  resource "aws_s3_bucket_versioning" "canuto-s3-versioning" {
  bucket = aws_s3_bucket.s3-first-bucket.id
  versioning_configuration {
    status = "Enabled"
  }
}