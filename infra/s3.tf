resource "aws_cloudfront_origin_access_identity" "this" {
  comment = "CloudFront Origin Access Identity for S3 buckets"
}

data "aws_iam_policy_document" "static_files_policy" {
  statement {
    actions = [
      "s3:GetObject"]
    resources = [
      "${aws_s3_bucket.static_files.arn}/*"]

    principals {
      type = "AWS"
      identifiers = [
        aws_cloudfront_origin_access_identity.this.iam_arn]
    }
  }

  statement {
    actions = [
      "s3:ListBucket"]
    resources = [
      aws_s3_bucket.static_files.arn]

    principals {
      type = "AWS"
      identifiers = [
        aws_cloudfront_origin_access_identity.this.iam_arn]
    }
  }
}

resource "aws_s3_bucket_policy" "static_files" {
  bucket = aws_s3_bucket.static_files.id
  policy = data.aws_iam_policy_document.static_files_policy.json
}

resource "aws_s3_bucket" "static_files" {
  bucket = "${local.name_prefix}-static-files"
  acl = "private"

  cors_rule {
    allowed_headers = [
      "*"]
    allowed_methods = [
      "GET",
      "HEAD"]
    allowed_origins = [
      "*"]
    max_age_seconds = 3000
  }
}
