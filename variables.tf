###############################################
######    Don't modify this file.      ########
###############################################

#AWS Region
variable "kmbl_aws_region" {
  type = string
  default = "us-east-1"
}

#Environment
variable "kmbl_environment" {
  type = string
}


#S3 Bucket Name
variable "kmbl_s3_bucket_name" {
  type = string
}


#S3 Customer Managed KMS Key
variable "kmbl_aws_kms_key" {
  type = string
  #default = "arn:aws:kms:ap-south-1:568118354422:key/e69863fe-d9db-4971-a9be-d14fbd4535f2"
}

#S3 Bucket Versioning
variable "kmbl_versioning_status" {
  type = string
  #default = "false"
}


#Tags Project Name
variable "kmbl_project_name" {
  type = string
  #default = "abc"
}

#Tags Project Owner
variable "kmbl_project_owner" {
  type = string
  #default = "xyz"
}

#S3 Bucket Policy Count
variable "kmbl_s3_bucket_policy_count" {
  type = number
  #default = "xyz"
}

#S3 Bucket IAM Policy Effect
variable "kmbl_s3_bucket_policy_effect" {
  type = string
  #default = "xyz"
}

#S3 Bucket IAM Policy Principal Value
variable "kmbl_s3_bucket_policy_principal" {
  type = string
  #default = "xyz"
}

#S3 Bucket IAM Policy Action
variable "kmbl_s3_bucket_policy_action" {
  type = string
  #default = "xyz"
}

