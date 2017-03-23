## LAMP Stack via Ansible on Vagrant
Setup LAMP Stack with RHEL/CentOS or Debian/Ubuntu using Ansible as provisioner on Vagrant

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

## Document Root
The folder `www` is where you should place your PHP project. It is mapped to `/var/www/dev` directory of the VM and is being used by a VirtualHost with a servername `local.dev`.

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
* repo-webtatic - Download and install [webtatic repo](https://webtatic.com/)
* webserver-tweaks - Configure SELinux, add apache user to vagrant group, add www project directory to document root
* config-repos - Install repos based on distribution

## Tested Distros
* Ubuntu 14.04 (Trusty)
* Ubuntu 16.04 (Xenial)
* Centos 6

## License
MIT
