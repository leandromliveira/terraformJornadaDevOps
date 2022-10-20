resource "digitalocean_droplet" "jenkins" {
  image    = "ubuntu-22-04-x64"
  name     = "jenkins"
  region   = var.region
  size     = "s-2vcpu-2gb"
  ssh_keys = [data.digital_ssh_key.jornada.id]
}

data "digital_ssh_key" "ssh_key" {
  name = var.ssh_key_name
}

resource "digitalocean_kubernetes_cluster" "k8s" {
  name    = "k8s"
  region  = var.region
  version = "1.24.4-do.0"

  node_pool {
    name       = "default"
    size       = "s-2vcpu-2gb"
    node_count = 2
  }
}

resource "local_file" "foo" {
  content  = digitalocean_kubernetes_cluster.k8s.kube_config.0.raw_config
  filename = "kube_config.yaml"
}
