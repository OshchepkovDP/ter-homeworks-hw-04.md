locals {
  public_key = file(var.ssh_public_key_path)
}

data "template_file" "cloudinit" {
  template = file("${path.module}/cloud-init.yml")
  vars = {
    ssh_key = local.public_key
  }
}
