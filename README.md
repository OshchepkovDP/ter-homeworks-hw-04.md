# Домашнее задание к занятию "`#«Продвинутые методы работы с Terraform» - Ощепков Дмитрий`"

### Инструкция по выполнению домашнего задания

1. Сделайте fork [репозитория c шаблоном решения](https://github.com/netology-code/sys-pattern-homework) к себе в Github и переименуйте его по названию или номеру занятия, например, https://github.com/имя-вашего-репозитория/gitlab-hw или https://github.com/имя-вашего-репозитория/8-03-hw).
2. Выполните клонирование этого репозитория к себе на ПК с помощью команды `git clone`.
3. Выполните домашнее задание и заполните у себя локально этот файл README.md:
   - впишите вверху название занятия и ваши фамилию и имя;
   - в каждом задании добавьте решение в требуемом виде: текст/код/скриншоты/ссылка;
   - для корректного добавления скриншотов воспользуйтесь инструкцией [«Как вставить скриншот в шаблон с решением»](https://github.com/netology-code/sys-pattern-homework/blob/main/screen-instruction.md);
   - при оформлении используйте возможности языка разметки md. Коротко об этом можно посмотреть в [инструкции по MarkDown](https://github.com/netology-code/sys-pattern-homework/blob/main/md-instruction.md).
4. После завершения работы над домашним заданием сделайте коммит (`git commit -m "comment"`) и отправьте его на Github (`git push origin`).
5. Для проверки домашнего задания преподавателем в личном кабинете прикрепите и отправьте ссылку на решение в виде md-файла в вашем Github.
6. Любые вопросы задавайте в чате учебной группы и/или в разделе «Вопросы по заданию» в личном кабинете.

Желаем успехов в выполнении домашнего задания.
---

### Задание 1

Возьмите из демонстрации к лекции готовый код для создания с помощью двух вызовов remote-модуля -> двух ВМ, относящихся к разным проектам(marketing и analytics) используйте labels для обозначения принадлежности. В файле cloud-init.yml необходимо использовать переменную для ssh-ключа вместо хардкода. Передайте ssh-ключ в функцию template_file в блоке vars ={} . Воспользуйтесь примером. Обратите внимание, что ssh-authorized-keys принимает в себя список, а не строку.
Добавьте в файл cloud-init.yml установку nginx.
Предоставьте скриншот подключения к консоли и вывод команды sudo nginx -t, скриншот консоли ВМ yandex cloud с их метками. Откройте terraform console и предоставьте скриншот содержимого модуля. Пример: > module.marketing_vm

Ответ:
Скриншот подтверждения установки Nginx
![exercise№1.jpg](https://github.com/OshchepkovDP/ter-homeworks-hw-04.md/blob/main/img/exercise%E2%84%961.jpg)

Скриншот подтверждения создания ВМ
![exercise№1-1.jpg](https://github.com/OshchepkovDP/ter-homeworks-hw-04.md/blob/main/img/exercise%E2%84%961-1.jpg)

Скриншот получения информации из консоли о модуле analytics
![Terraform_console_analytics.jpg](https://github.com/OshchepkovDP/ter-homeworks-hw-04.md/blob/main/img/Terraform_console_analytics.jpg)

Скриншот получения информации из консоли о модуле marketing
![Terraform_console_marketing.jpg](https://github.com/OshchepkovDP/ter-homeworks-hw-04.md/blob/main/img/Terraform_console_marketing.jpg)

---

### Задание 2

Напишите локальный модуль vpc, который будет создавать 2 ресурса: одну сеть и одну подсеть в зоне, объявленной при вызове модуля, например: ru-central1-a.
Вы должны передать в модуль переменные с названием сети, zone и v4_cidr_blocks.
Модуль должен возвращать в root module с помощью output информацию о yandex_vpc_subnet. Пришлите скриншот информации из terraform console о своем модуле. Пример: > module.vpc_dev
Замените ресурсы yandex_vpc_network и yandex_vpc_subnet созданным модулем. Не забудьте передать необходимые параметры сети из модуля vpc в модуль с виртуальной машиной.
Сгенерируйте документацию к модулю с помощью terraform-docs.
Пример вызова

```
module "vpc_dev" {
  source       = "./vpc"
  env_name     = "develop"
  zone = "ru-central1-a"
  cidr = "10.0.1.0/24"
}
```
Ответ:

Скриншот получения информации из консоли о модуле vpc_dev_a
![Terraform_console_modules.jpg](https://github.com/OshchepkovDP/ter-homeworks-hw-04.md/blob/main/img/Terraform_console_modules.jpg)

Ссылка на сгенерированную документацию

https://github.com/OshchepkovDP/ter-homeworks-hw-04.md/blob/main/demonstration1/vms/modules/vpc/README.md

---

### Задание 3

Выведите список ресурсов в стейте.
Полностью удалите из стейта модуль vpc.
Полностью удалите из стейта модуль vm.
Импортируйте всё обратно. Проверьте terraform plan. Значимых(!!) изменений быть не должно. Приложите список выполненных команд и скриншоты процессы.

Ответ:

Скриншот вывода команды terraform state list
![terraform_state_rm.jpg](https://github.com/OshchepkovDP/ter-homeworks-hw-04.md/blob/main/img/terraform_state_rm.jpg)

Скриншот вывода команды terraform plan
![terraform_plan.jpg](https://github.com/OshchepkovDP/ter-homeworks-hw-04.md/blob/main/img/terraform_plan.jpg)
