## LAMP Stack via Ansible on Vagrant
Setup LAMP Stack with RHEL/CentOS using Ansible as provisioner on Vagrant

## Requirements
1. VirtualBox installed - get it from https://www.virtualbox.org/wiki/Downloads
2. Vagrant installed - get it from http://www.vagrantup.com/downloads.html

## Vagrantfile
To change box, update the directive below inside the Vagrantfile

`config.vm.box = "centos-7.0"`

Make sure the box exist. You can get more boxes from [Vagrantboxes](http://www.vagrantbox.es/) and [Vagrantcloud](https://atlas.hashicorp.com/boxes/search?utm_source=vagrantcloud.com&vagrantcloud=1).

You can add box by running:

```
$ vagrant box add {title} {url}
ex:
$ vagrant box add centos-7.0 https://f0fff3908f081cb6461b407be80daf97f07ac418.googledrive.com/host/0BwtuV7VyVTSkUG1PM3pCeDJ4dVE/centos7.box
```

or

```
$ vagrant box add username/box-name
ex:
$ vagrant box add centos/7
```

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
