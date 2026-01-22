resource "yandex_vpc_network" "vpc" {
  count = var.create_network ? 1 : 0  # Создаём сеть только если create_network = true


  name = var.network_name
}

resource "yandex_vpc_subnet" "subnet" {
  name           = "${var.network_name}-${var.subnet_zone}"
  zone           = var.subnet_zone
  network_id     = var.create_network ? yandex_vpc_network.vpc[0].id : var.existing_network_id
  v4_cidr_blocks = [var.subnet_cidr]
}
