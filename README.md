# Проект "DevOps для программистов" 77

Этот репозиторий содержит код инфраструктуры и файлы конфигурации для проекта "DevOps для программистов" 77. Ниже приведены инструкции по настройке и управлению инфраструктурой с использованием Terraform и Ansible.

## Информация о Проекте

### Тесты Hexlet и Статус Линтера
[![Статус действий](https://github.com/ivanmakovetskiy/devops-for-programmers-project-77/actions/workflows/hexlet-check.yml/badge.svg)](https://github.com/ivanmakovetskiy/devops-for-programmers-project-77/actions)

### URL Приложения
[77.makovetskiy.xyz](https:/77.makovetskiy.xyz)

## Требования

- Ubuntu
- make
- jq
- Terraform
- Ansible

## Команды Terraform

### Инициализация Terraform
```bash
make init
```
Эта команда инициализирует Terraform в каталоге `terraform`.

### Проверка Конфигурации Terraform
```bash
make tf-validate
```
Эта команда проверяет конфигурацию Terraform в каталоге `terraform`.

### Планирование Развёртывания Terraform
```bash
make plan
```
Эта команда генерирует план выполнения для развёртывания Terraform в каталоге `terraform`.

### Применение Конфигурации Terraform
```bash
make apply
```
Эта команда применяет конфигурацию Terraform, используя скрипт `apply_configuration.sh` в каталоге `terraform`.

### Уничтожение Инфраструктуры Terraform
```bash
make destroy
```
Эта команда уничтожает инфраструктуру, управляемую Terraform, в каталоге `terraform`.

## Команды Ansible

### Установка Ролей Ansible
```bash
make install
```
Эта команда устанавливает роли Ansible, указанные в `ansible/requirements.yml`.

### Развёртывание Конфигурации
```bash
make deploy
```
Эта команда развёртывает конфигурацию, используя плейбук Ansible, расположенный в `ansible/playbook.yml`, с файлом инвентаря в `ansible/inventory.ini`.

### Шифрование Файла Vault Ansible
```bash
make encrypt
```
Эта команда шифрует файл Vault Ansible, расположенный в `ansible/group_vars/webservers/vault.yml`. Необходимо предоставить файл пароля Vault.

### Расшифровка Файла Vault Ansible
```bash
make decrypt
```
Эта команда расшифровывает файл Vault Ansible, расположенный в `ansible/group_vars/webservers/vault.yml`. Необходимо предоставить файл пароля Vault.

## Настройка Переменных Окружения

Для Terraform убедитесь, что вы установили необходимые переменные окружения для аутентификации.

Для Ansible Vault убедитесь, что вы создали файл пароля Vault и указали путь к нему в соответствующих командах.

Не стесняйтесь обращаться, если у вас возникнут вопросы или понадобится дополнительная помощь!
