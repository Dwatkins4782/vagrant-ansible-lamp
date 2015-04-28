#!/bin/bash
#
# Windows shell provisioner for Ansible playbooks, based on KSid's
# windows-vagrant-ansible: https://github.com/KSid/windows-vagrant-ansible
#
# @see README.md
# @author Jeff Geerling, 2014

# Uncomment if behind a proxy server.
# export {http,https,ftp}_proxy='http://username:password@proxy-host:80'

ANSIBLE_PLAYBOOK=$1

# Add YUM timeout for slow connection
echo "Adding yum timeout directives for slow connection."
sudo sed -i '/^debuglevel/a\timeout=999' /etc/yum.conf

# Detect package management system.
YUM=$(which yum)

# Make sure Ansible playbook exists.
if [ ! -f /vagrant/$ANSIBLE_PLAYBOOK ]; then
  echo "Cannot find Ansible playbook."
  exit 1
fi

# Install Ansible and its dependencies if it's not installed already.
if [ ! -f /usr/bin/ansible ]; then
  echo "Installing Ansible dependencies and Git."
  if [[ ! -z $YUM ]]; then
    sudo yum install -y git python python-devel
  else
    echo "Yum not available."
    exit 1;
  fi

  echo "Enabling EPEL repo for CentOS 7"
  wget http://dl.fedoraproject.org/pub/epel/7/x86_64/e/epel-release-7-5.noarch.rpm
  sudo rpm -ivh epel-release-7-5.noarch.rpm

  echo "Installing Ansible."
  sudo yum install ansible -y
fi

# Run the playbook.
echo "Running Ansible provisioner defined in Vagrantfile."
ansible-playbook -i 'localhost,' /vagrant/${ANSIBLE_PLAYBOOK} --extra-vars "is_windows=true" --connection=local
