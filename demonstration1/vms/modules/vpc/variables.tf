variable "network_name" {
  type        = string
  description = "Имя VPC-сети"
}

variable "subnet_zone" {
  type        = string
  description = "Зона для подсети"
}

variable "subnet_cidr" {
  type        = string
  description = "CIDR-диапазон подсети"
}

variable "create_network" {
  type    = bool
  default = true
  description = "Создавать новую сеть или использовать существующую?"
}

variable "existing_network_id" {
  type    = string
  default = null
  description = "ID существующей сети (если create_network = false)"
}
