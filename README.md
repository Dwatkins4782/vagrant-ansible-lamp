## LAMP Stack via Ansible on Vagrant
[![Build Status](https://travis-ci.org/iambryancs/vagrant-ansible-lamp.svg?branch=master)](https://travis-ci.org/iambryancs/vagrant-ansible-lamp)

Setup LAMP Stack with RHEL/CentOS or Debian/Ubuntu using Ansible as provisioner on Vagrant

## Requirements
1. Make sure your machine supports Virtualization
2. VirtualBox installed - get it from https://www.virtualbox.org/wiki/Downloads
3. Vagrant installed - get it from http://www.vagrantup.com/downloads.html

## Provisioning
Vagrant uses ansible local provisioning so it should work fine on Windows and Linux where no ansible is installed on the host machine.

## LAMP
### Linux
These are a few of the distros that works out of the box. Other versions under the RHEL/Debian family should work with minimal changes to the configurations.
* Ubuntu 14.04 (Trusty)
* Centos 6.8
#### Related config
You can change the type of distribution you want by updating the `config.vm.box` part of the `Vagrantfile`.
```
config.vm.box = 'geerlingguy/centos6'
```
### Apache
See [ansible-role-apache](https://github.com/geerlingguy/ansible-role-apache) for more info on Apache.
#### Related config
You can update the VirtualHost's `servername` and `alias` by editing `vars/main.yml`
```yml
apache_vhosts:
  - servername: "local.dev"
    serveralias: "local.dev"
    documentroot: "/var/www/vagrant/html"
```
### MySQL
See [ansible-role-mysql](https://github.com/geerlingguy/ansible-role-mysql) for more info on MySQL.
#### Related config
Below are some of the variables specific to MySQL
```yml
# vars/main.yml
mysql_root_password: root
mysql_databases:
  - name: sample_db
    encoding: latin1
    collation: latin1_general_ci
mysql_users:
  - name: vagrant
    host: "%"
    password: vagrant
    priv: "sample_db.*:ALL"
mysql_enabled_on_startup: yes
```
### PHP
See [ansible-role-php](https://github.com/geerlingguy/ansible-role-php) for more info on PHP.
#### Related config
Below are some of the variables specific to PHP
```yml
# vars/main.yml
php_enablerepo: "epel"
php_opcache_enable: "0"
php_enable_apc: false
```
```yml
# vars/RedHat.yml
php_packages:
  - php56w
  - php56w-cli
  - php56w-common
  - php56w-dom
  - php56w-gd
  - php56w-mysql
```
```yml
# vars/Debian.yml
php_packages:
  - libapache2-mod-php5.6
  - php5.6
  - php5.6-cli
  - php5.6-common
  - php5.6-dom
  - php5.6-gd
  - php5.6-mysql
```

## Document Root
The folder `html` is where you should place your PHP project. It is mapped to `/var/www/vagrant/html` directory of the VM and is being used by a VirtualHost with a servername `local.dev`.

## Hosts Resolution
In order for your project to be accessible, you need to edit your hosts file and add the following:
```
127.0.0.1 local.dev
```

### Windows
For Windows host machine, you can edit your hosts file by doing the ff:
1. Run cmd as administrator
  * Search for cmd in start menu > right click > run as administrator
2. Once in cmd, enter the ff:
  `notepad drivers\etc\hosts`
3. Add the lines above and save

### Linux
For Linux host machine, you can edit your hosts file by doing the ff:
1. Launch terminal
2. Once in terminal, enter the ff:
  `sudo vi /etc/hosts`
3. Add the lines above and save 

Once you've updated your hosts file, you can now access your project at http://local.dev:8080

## Ansible Roles
* [ansible-role-repo-epel](https://github.com/geerlingguy/ansible-role-repo-epel) - Installs [EPEL](https://fedoraproject.org/wiki/EPEL) repo
* [ansible-role-mysql](https://github.com/geerlingguy/ansible-role-mysql) - Installs MySQL database server
* [ansible-role-apache](https://github.com/geerlingguy/ansible-role-apache) - Installs Apache server
* [ansible-role-php](https://github.com/geerlingguy/ansible-role-php) - Installs PHP and some of its common modules
* [ansible-role-ppa-ondrej](https://github.com/iambryancs/ansible-role-ppa-ondrej) - Installs [ondrej/php](https://launchpad.net/~ondrej/+archive/ubuntu/php) ppa for Debian/Ubuntu
* [ansible-role-repo-webtatic](https://github.com/iambryancs/ansible-role-repo-webtatic) - Installs the [Webtatic repository](https://webtatic.com/) on RHEL/CentOS
* config-repos - Install repos based on distribution

## License
MIT
