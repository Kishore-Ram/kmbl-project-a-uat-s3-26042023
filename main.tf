#######################################################################################################
#############################    Don't modify the code here           #################################
#######################################################################################################

#Create S3 Bucket
## Using Bucket Versioning Disabled
## Using Customer Managed KMS Key
## Disable Public Access and ACL
resource "aws_s3_bucket" "kmbl_s3" {
  bucket        = "${var.kmbl_s3_bucket_name}-${var.kmbl_environment}"
  tags          = var.kmbl_common_tags
}

resource "aws_s3_bucket_versioning" "kmbl_s3_versioning" {
  bucket = aws_s3_bucket.kmbl_s3.id
  versioning_configuration {
    status = var.kmbl_versioning_status
  }
}

resource "aws_s3_bucket_server_side_encryption_configuration" "kmbl_s3_kms" {
  bucket = aws_s3_bucket.kmbl_s3.id

  rule {
    apply_server_side_encryption_by_default {
      kms_master_key_id = var.kmbl_aws_kms_key
      sse_algorithm     = "aws:kms"
    }
  }
}

resource "aws_s3_bucket_acl" "kmbl_s3_acl_private" {
  #depends_on = [aws_s3_bucket_ownership_controls.example]

  bucket = aws_s3_bucket.kmbl_s3.id
  acl    = "private"
}

resource "aws_s3_bucket_public_access_block" "kmbl_s3_block_public" {
  bucket = aws_s3_bucket.kmbl_s3.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

resource "aws_s3_bucket_policy" "s3_policy_attach" {
  count = var.kmbl_s3_bucket_policy_count
  bucket = aws_s3_bucket.kmbl_s3.id
  policy = <<EOF
          {
            "Version": "2012-10-17",
            "Statement": [
              {
                "Effect": "${var.kmbl_s3_bucket_policy_effect}",
                "Principal": "${var.kmbl_s3_bucket_policy_principal}",
                "Action": [ "${var.kmbl_s3_bucket_policy_action}" ],
                "Resource": [
                  "${aws_s3_bucket.kmbl_s3.arn}",
                  "${aws_s3_bucket.kmbl_s3.arn}/*"
                ]
              }
            ]
          }
          EOF
}
