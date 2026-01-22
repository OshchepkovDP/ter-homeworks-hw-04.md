variable "cloud_id" {
  description = "ID облака Yandex Cloud"
  type        = string
}

variable "folder_id" {
  description = "ID папки в Yandex Cloud"
  type        = string
}

variable "sa_key_path" {
  description = "Путь к файлу ключа сервисного аккаунта (.json)"
  type        = string
  default     = "/home/skk/.authorized_key.json"
}

variable "zone" {
  description = "Зона по умолчанию"
  type        = string
  default     = "ru-central1-a"
}

variable "ssh_public_key_path" {
  description = "Путь к публичному SSH‑ключу"
  type        = string
  default     = "~/.ssh/id_ed25519.pub"
}
