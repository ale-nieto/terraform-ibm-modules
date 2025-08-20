output "cos_endpoint" {
  description = "The public endpoint for the Cloud Object Storage instance."
  value       = ibm_cos_bucket.bucket.s3_endpoint_public
}

output "cos_bucket_name" {
  description = "The name of the Cloud Object Storage bucket for static content."
  value       = ibm_cos_bucket.bucket.bucket_name
}

output "s3_endpoint_direct" {
  description = "The direct S3 endpoint for the Cloud Object Storage bucket."
  value       = ibm_cos_bucket.bucket.s3_endpoint_direct
}

output "s3_endpoint_public" {
  description = "The public S3 endpoint for the Cloud Object Storage bucket."
  value       = ibm_cos_bucket.bucket.s3_endpoint_public
}

output "s3_endpoint_private" {
  description = "The private S3 endpoint for the Cloud Object Storage bucket."
  value       = ibm_cos_bucket.bucket.s3_endpoint_private
}

output "id" {
  description = "The ID of the created COS instance."
  value       = ibm_resource_instance.cos_instance.id
}