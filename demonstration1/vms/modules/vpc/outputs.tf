output "network_id" {
  value = var.create_network ? yandex_vpc_network.vpc[0].id : var.existing_network_id
  description = "ID сети (созданной или переданной)"
}

output "subnet_id" {
  value = yandex_vpc_subnet.subnet.id
  description = "ID подсети"
}

output "subnet_cidr" {
  value = var.subnet_cidr
  description = "CIDR подсети"
}

output "zone" {
  value = var.subnet_zone
  description = "Зона подсети"
}
