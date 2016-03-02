# -*- mode: ruby -*-
# vi: set ft=ruby :

PRJ_DIR="/usr/src/local/project"
Vagrant.configure(2) do |config|
  config.vm.box = "centos/7"

  config.vm.provider "virtualbox" do |vb|
    vb.memory = "2048"
  end

  config.vm.network "forwarded_port", guest: 8080, host: 8080

  config.vm.synced_folder "./", PRJ_DIR

  # this is a hack because for some reason ansible_local wants to 'cd /vagrant' although I do not have that dir
  config.vm.provision "shell", inline: "mkdir -p /vagrant"
  config.vm.provision "shell", inline: "command -v git > /dev/null 2>&1 || yum install -y git"

  config.vm.provision "ansible_local" do |a|
    a.playbook = "#{PRJ_DIR}/ansible/playbook.yml"
    a.verbose = true
    a.install = true #install ansible if not available
    a.galaxy_role_file = "#{PRJ_DIR}/ansible/galaxy.yml"
  end
end
