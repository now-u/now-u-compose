resource "digitalocean_vpc" "vpc" {
  name    = "now-u-vpc"
  region  = "lon1"
}

# Create nodes
resource "digitalocean_droplet" "servers" {
  count     = 3
  image     = "ubuntu-20-04-x64"
  name      = "now-u-server-${count.index}"
  region    = "lon1"
  size      = "s-1vcpu-1gb"
  vpc_uuid  = digitalocean_vpc.vpc.id
  ssh_keys  = ["e9:bf:52:42:12:f5:11:56:99:47:66:81:14:c8:ff:64"]
}
