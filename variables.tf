# Set the variable value in *.tfvars file
# or using the -var="hcloud_token=..." CLI option
variable "hcloud_token" {
  sensitive = true
}

variable "ssh_key" {
  sensitive = true
}

variable "domain" {
  description = "The domain name to use for the server."
  type        = string
}