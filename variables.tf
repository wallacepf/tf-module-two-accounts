variable "vault_token" {}

variable "name" {
  default = "my-demo"
}

variable "key_name" {
  default = "tfe-demo-key"
}

variable "vpc_security_group_ids" {
  default = "sg-083e4cbbb3bec0d1d"
}
variable "subnet_id" {
  default = "sg-083e4cbbb3bec0d1d"
}