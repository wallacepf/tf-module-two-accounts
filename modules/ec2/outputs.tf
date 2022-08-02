output "inst_dns" {
  value = module.ec2_instance.public_dns
}

output "tags" {
  value = module.ec2_instance.tags_all
}