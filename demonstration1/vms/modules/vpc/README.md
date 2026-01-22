## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.12.0 |
| <a name="requirement_yandex"></a> [yandex](#requirement\_yandex) | >= 0.170.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_yandex"></a> [yandex](#provider\_yandex) | >= 0.170.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [yandex_vpc_network.vpc](https://registry.terraform.io/providers/yandex-cloud/yandex/latest/docs/resources/vpc_network) | resource |
| [yandex_vpc_subnet.subnet](https://registry.terraform.io/providers/yandex-cloud/yandex/latest/docs/resources/vpc_subnet) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_create_network"></a> [create\_network](#input\_create\_network) | Создавать новую сеть или использовать существующую? | `bool` | `true` | no |
| <a name="input_existing_network_id"></a> [existing\_network\_id](#input\_existing\_network\_id) | ID существующей сети (если create\_network = false) | `string` | `null` | no |
| <a name="input_network_name"></a> [network\_name](#input\_network\_name) | Имя VPC-сети | `string` | n/a | yes |
| <a name="input_subnet_cidr"></a> [subnet\_cidr](#input\_subnet\_cidr) | CIDR-диапазон подсети | `string` | n/a | yes |
| <a name="input_subnet_zone"></a> [subnet\_zone](#input\_subnet\_zone) | Зона для подсети | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_network_id"></a> [network\_id](#output\_network\_id) | ID сети (созданной или переданной) |
| <a name="output_subnet_cidr"></a> [subnet\_cidr](#output\_subnet\_cidr) | CIDR подсети |
| <a name="output_subnet_id"></a> [subnet\_id](#output\_subnet\_id) | ID подсети |
| <a name="output_zone"></a> [zone](#output\_zone) | Зона подсети |
