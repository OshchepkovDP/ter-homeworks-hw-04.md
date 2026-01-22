module "vpc_dev_a" {
  source = "./modules/vpc"

  network_name   = "develop"
  subnet_zone   = "ru-central1-a"
  subnet_cidr   = "10.0.1.0/24"
  create_network = true 
}

module "vpc_dev_b" {
  source = "./modules/vpc"

  network_name         = "develop"
  subnet_zone         = "ru-central1-b"
  subnet_cidr         = "10.0.2.0/24"
  create_network       = false 
  existing_network_id = module.vpc_dev_a.network_id  # Использует сеть из vpc_dev_a
}

module "marketing_vm" {
  source         = "git::https://github.com/udjin10/yandex_compute_instance.git?ref=main"
  env_name       = "marketing"
  network_id     = module.vpc_dev_a.network_id
  subnet_zones   = ["ru-central1-a"]
  subnet_ids     = [module.vpc_dev_a.subnet_id]
  instance_name  = "marketing-vm"
  instance_count = 1
  image_family   = "ubuntu-2004-lts"
  public_ip      = true

  labels = {
    owner   = "i.ivanov"
    project = "marketing"
  }

  metadata = {
    user-data          = data.template_file.cloudinit.rendered
    serial-port-enable = 1
  }
}

module "analytics_vm" {
  source         = "git::https://github.com/udjin10/yandex_compute_instance.git?ref=main"
  env_name       = "analytics"
  network_id     = module.vpc_dev_b.network_id
  subnet_zones   = ["ru-central1-b"]
  subnet_ids     = [module.vpc_dev_b.subnet_id]
  instance_name  = "analytics-vm"
  instance_count = 1
  image_family   = "ubuntu-2004-lts"
  public_ip      = true

  labels = {
    owner   = "i.ivanov"
    project = "analytics"
  }

  metadata = {
    user-data          = data.template_file.cloudinit.rendered
    serial-port-enable = 1
  }
}
