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

    content = file("${path.root}/00-initial-script.sh")
  }

  part {
    filename     = "01-nginx-proxy.sh"
    content_type = "text/x-shellscript"

    content = file("${path.root}/01-nginx-proxy.sh")
  }

  part {
    filename     = "02-hi-events.sh"
    content_type = "text/x-shellscript"

    content = file("${path.root}/02-hi-events.sh")
  }


}