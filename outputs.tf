output "instance_ip_addr" {
  value       = hcloud_server.server-1.ipv4_address
  description = "The private IP address of the main server instance."
}