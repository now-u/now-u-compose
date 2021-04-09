resource "digitalocean_vpc" "vpc" {
  name    = "now-u-vpc"
  region  = "lon1"
}

# Create nodes
resource "digitalocean_droplet" "servers" {
  count     = var.node_count
  image     = "ubuntu-20-04-x64"
  name      = "now-u-server-${count.index}"
  region    = "lon1"
  size      = count.index <= var.master_count ? "s-2vcpu-2gb" : "s-1vcpu-1gb"
  ssh_keys  = ["e9:bf:52:42:12:f5:11:56:99:47:66:81:14:c8:ff:64"]
  vpc_uuid  = digitalocean_vpc.vpc.id
  tags      = ["now-u-nodes"]
}

resource "digitalocean_firewall" "web" {
  name = "now-u-firewall"

  droplet_ids = digitalocean_droplet.servers.*.id

  inbound_rule {
    protocol         = "tcp"
    port_range       = "1-65535"
    source_addresses = ["0.0.0.0/0", "::/0"]
  }
  
  inbound_rule {
    protocol         = "udp"
    port_range       = "1-65535"
    source_addresses = ["0.0.0.0/0", "::/0"]
  }
  
  outbound_rule {
    protocol         = "tcp"
    port_range       = "1-65535"
    destination_addresses = ["0.0.0.0/0", "::/0"]
  }
  
  outbound_rule {
    protocol         = "udp"
    port_range       = "1-65535"
    destination_addresses = ["0.0.0.0/0", "::/0"]
  }
}
