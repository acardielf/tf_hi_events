resource "hcloud_server" "server-1" {
  name        = "server-1"
  image       = "ubuntu-22.04"
  server_type = "cx22" # 2 vCPUs, 4 GB RAM # aprox 5 eur/month
  public_net {
    ipv4_enabled = true
    ipv6_enabled = true
  }
  location  = "nbg1"
  user_data = data.cloudinit_config.initial.rendered
  firewall_ids = [hcloud_firewall.firewall.id]
  ssh_keys = [hcloud_ssh_key.main.id]
}