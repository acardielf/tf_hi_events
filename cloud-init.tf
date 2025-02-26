data "cloudinit_config" "initial" {
  gzip          = false
  base64_encode = false

  part {
    filename     = "cloud-init.yaml"
    content_type = "text/cloud-config"

    content = file("${path.root}/cloud-init.yaml")
  }

  part {
    filename     = "00-initial-script.sh"
    content_type = "text/x-shellscript"

    content = templatefile("${path.root}/00-initial-script.sh.tpl", {
      app_domain = sensitive(var.app_domain),
      app_mail_host       = var.app_mail_host,
      app_mail_port       = var.app_mail_port,
      app_mail_username   = var.app_mail_username,
      app_mail_encryption = var.app_mail_encryption,
      app_mail_from_email = var.app_mail_from_email,
      app_mail_from_name  = var.app_mail_from_name,
      app_mail_password = sensitive(var.app_mail_password),
    })
  }

  part {
    filename     = "01-nginx-proxy.sh"
    content_type = "text/x-shellscript"

    content = templatefile("${path.root}/01-nginx-proxy.sh.tpl", {
      nginx_user = sensitive(var.nginx_proxy_manager_admin_email),
      nginx_password = sensitive(var.nginx_proxy_manager_admin_password)
    })
  }

  part {
    filename     = "02-hi-events.sh"
    content_type = "text/x-shellscript"

    content = file("${path.root}/02-hi-events.sh")
  }


}