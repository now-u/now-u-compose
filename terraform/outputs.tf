output "server-ips" {
    description = "The ips of the k3s servers"
    value = "${formatlist("%v", digitalocean_droplet.servers.*.ipv4_address)}"
}
