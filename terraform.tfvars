#################################################################################################
##########################  Update required variables here          #############################
#################################################################################################

kmbl_aws_region                     = "ap-south-1"
kmbl_s3_bucket_name                 = "kmbl-projecta-260423"
kmbl_aws_kms_key                    = "arn:aws:kms:ap-south-1:249176918067:key/2bfdfd30-d968-4949-af5f-e56e17544e15"
kmbl_versioning_status              = "Disabled"            #Options are 'Disabled', 'Enabled', 'Suspended'
kmbl_environment                    = "uat"                 #Only LOWERCASE characters allowed
kmbl_s3_bucket_policy_count         = 0                     #Count must be either 0 or 1
kmbl_s3_bucket_policy_effect        = "Allow"               #Effect must be ONLY Allow
kmbl_s3_bucket_policy_principal     = "*"                   #Give the resource name or * for all resources
kmbl_s3_bucket_policy_action        = "s3:*"                #Give the resource actions for s3

kmbl_common_tags               = {
    "Project Name"             = "Project-A"
    "Project Owner"            = "Kavindra"
    "Name"                     = "kmbl-projecta-uat-260423"
    "Environment"              = "uat"
    "Remedy ID"                = "REQ0000012345"
}