output "bucket_domain" {
  value = module.s3.bucket_domain
}

output "inst_dns" {
  value = module.ec2.inst_dns
}

output "tags" {
  value = module.ec2.tags
}