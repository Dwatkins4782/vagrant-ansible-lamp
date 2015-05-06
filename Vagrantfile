# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  # All Vagrant configuration is done here. The most common configuration
  # options are documented and commented below. For a complete reference,
  # please see the online documentation at vagrantup.com.

  # Every Vagrant virtual environment requires a box to build off of.
  config.vm.box = "centos-7.0"

  # The url from where the 'config.vm.box' box will be fetched if it
  # doesn't already exist on the user's system.
  # config.vm.box_url = "http://domain.com/path/to/above.box"

  # Create a forwarded port mapping which allows access to a specific port
  # within the machine from a port on the host machine. In the example below,
  # accessing "localhost:8080" will access port 80 on the guest machine.
  config.vm.network :forwarded_port, guest: 80, host: 8080
  config.vm.network :forwarded_port, guest: 3306, host: 3306

  # Create a private network, which allows host-only access to the machine
  # using a specific IP.
  config.vm.network "private_network", ip: "10.0.0.10", auto_config: false

  # Create a public network, which generally matched to bridged network.
  # Bridged networks make the machine appear as another physical device on
  # your network.
  # config.vm.network :public_network

  # If true, then any SSH connections made will enable agent forwarding.
  # Default value: false
  # config.ssh.forward_agent = true

  # Share an additional folder to the guest VM. The first argument is
  # the path on the host to the actual folder. The second argument is
  # the path on the guest to mount the folder. And the optional third
  # argument is a set of non-required options.
  # config.vm.synced_folder "../data", "/vagrant_data"

  # Provider-specific configuration so you can fine-tune various
  # backing providers for Vagrant. These expose provider-specific options.
  # Example for VirtualBox:
  #
  config.vm.provider :virtualbox do |vb|
      # Change name
      vb.name = "base"

  #   # Don't boot with headless mode
  #   vb.gui = true
  #
  #   # Use VBoxManage to customize the VM. For example to change memory:
  #   vb.customize ["modifyvm", :id, "--memory", "1024"]
  #
  #    file_to_disk = './tmp/large_disk.vdi'
  #    vb.customize ['createhd', '--filename', file_to_disk, '--size', 25 * 1024]
  #    vb.customize ['storageattach', :id, '--storagectl', 'SATA', '--port', 1, '--device', 0, '--type', 'hdd', '--medium', file_to_disk]
  end

  require 'rbconfig'
  is_windows = (RbConfig::CONFIG['host_os'] =~ /mswin|mingw|cygwin/)
	if is_windows
	  # Provisioning configuration for shell script.
	  config.vm.provision "shell" do |sh|
	    sh.path = "provisioning/JJG-Ansible-Windows/windows.sh"
      sh.args = "provisioning/playbook.yml"
	  end
	else
	  # Provisioning configuration for Ansible (for Mac/Linux hosts).
	  config.vm.provision "ansible" do |ansible|
	    ansible.playbook = "provisioning/playbook.yml"
	    ansible.sudo = true
	  end
	end

  #config.vm.provision :shell, :path => "install_drupal.sh"
end
