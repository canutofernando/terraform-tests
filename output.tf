output "output_bucket_s3_avengers_arn" {
    value =  aws_s3_bucket.s3-first-bucket.arn
}

output "output_aws_iam_access_key_canutera" {
    value =  aws_iam_access_key.aws_iam_access_key_canutera.id
}

output "output_aws_iam_secret_key_canutera" {
    value =  aws_iam_access_key.aws_iam_access_key_canutera.secret
    sensitive = true
}

output "iam_arn" {
    value = aws_iam_user.aws_iam_user_canutera.arn
}