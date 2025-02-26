# Set the variable value in *.tfvars file
# or using the -var="hcloud_token=..." CLI option
variable "hcloud_token" {
  sensitive = true
}

variable "ssh_key" {
  sensitive = true
}

variable "app_domain" {
  description = "The domain name to use for the server."
  type        = string
}

variable "app_main_domain" {
  description = "The main domain name to use for the server."
  type        = string
}


variable "app_mail_host" {
  type = string
}

variable "app_mail_port" {
  type = string
}

variable "app_mail_encryption" {
  type = string
}

variable "app_mail_username" {
  type = string
}

variable "app_mail_from_email" {
  type = string
}

variable "app_mail_from_name" {
  type = string
}

variable "app_mail_password" {
  description = "The password for the email account."
  type        = string
  sensitive   = true
}

variable nginx_proxy_manager_admin_email {
  description = "The email address of the admin user for the Nginx Proxy Manager."
  type        = string
}

variable nginx_proxy_manager_admin_password {
  description = "The password of the admin user for the Nginx Proxy Manager."
  type        = string
  sensitive   = true
}