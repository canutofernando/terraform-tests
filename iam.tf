resource "aws_iam_user" "aws_iam_user_canutera" {
  name = "${var.project}-canutera"
  tags = var.tags
}

resource "aws_iam_access_key" "aws_iam_access_key_canutera" {
  user = aws_iam_user.aws_iam_user_canutera.name
}

data "aws_iam_policy_document" "policy_canutera" {
  statement {
    actions = [
        "s3:*"
    ]  
    resources = [
      "arn:aws:s3:::${aws_s3_bucket.s3-first-bucket.id}",
      "arn:aws:s3:::${aws_s3_bucket.s3-first-bucket.id}/*",
    ]
  }
}

resource "aws_iam_policy" "policy" {
  name   = "iam_policy_permission_canutera_s3"
  policy = data.aws_iam_policy_document.policy_canutera.json
  tags  = var.tags
}

resource "aws_iam_policy_attachment" "policy_canutera_attachment" {
  name       = "canutera_attachment"
  users      = [aws_iam_user.aws_iam_user_canutera.name]
  policy_arn = aws_iam_policy.policy.arn
}