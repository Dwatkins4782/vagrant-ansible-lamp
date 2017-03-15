## LAMP Stack via Ansible on Vagrant
Setup LAMP Stack with RHEL/CentOS using Ansible as provisioner on Vagrant

## Component Versions
OS: Centos 6.8
Apache: 2.2
MySQL: 5.1
PHP: 5.5

## Requirements
1. Make sure your machine supports Virtualization
2. VirtualBox installed - get it from https://www.virtualbox.org/wiki/Downloads
3. Vagrant installed - get it from http://www.vagrantup.com/downloads.html

## Provisioning
Vagrant uses ansible local provisioning so it should work fine on Windows and Linux where no ansible is installed on the host machine.

## Ansible Role Variables
Below are some of the variables available for specific user configs.
These variables can be modified in `vars/main.yml`
```yml
mysql_root_password: root
mysql_databases:
  - name: sample_db
    encoding: latin1
    collation: latin1_general_ci
mysql_users:
  - name: dev
    host: "%"
    password: dev
    priv: "sample_db.*:ALL"
mysql_enabled_on_startup: yes
```
## Ansible Roles
There are currently three roles for ansible

* [ansible-role-repo-epel](https://github.com/geerlingguy/ansible-role-repo-epel) - Installs [EPEL](https://fedoraproject.org/wiki/EPEL) repo
* [ansible-role-mysql](https://github.com/geerlingguy/ansible-role-mysql) - Installs MySQL database server
* [ansible-role-apache](https://github.com/geerlingguy/ansible-role-apache) - Installs Apache server
* [ansible-role-php](https://github.com/geerlingguy/ansible-role-php) - Installs PHP and some of its common modules
* repo-webtatic - Download and install [webtatic repo](https://webtatic.com/)
* extra - Configure SELinux, add www project directory to document root

## License
MIT
