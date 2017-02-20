# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = "centos/7"
  config.vm.network :forwarded_port, guest: 80, host: 8080
  #config.vm.network :forwarded_port, guest: 3306, host: 3306
  config.vm.hostname = "lamp"
  config.vm.network "private_network", ip: "10.0.0.10"

  #Set name
  config.vm.define :lamp do |lamp|
  end

  config.vm.provider :virtualbox do |vb|      
    vb.name = "lamp"
    vb.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
    vb.customize ["modifyvm", :id, "--ioapic", "on"]
  end

  config.vm.provision :ansible_local do |ansible|
    ansible.playbook       = "provisioning/playbook.yml"
    ansible.verbose        = true
    ansible.install        = true
    ansible.limit          = "all"
    ansible.galaxy_role_file= "requirements.yml"
    ansible.inventory_path = "provisioning/inventory"
  end
end
