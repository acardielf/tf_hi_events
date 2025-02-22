resource "hcloud_ssh_key" "main" {
  name       = "ssh-key (${var.ssh_key})"
  public_key = file(var.ssh_key)
}