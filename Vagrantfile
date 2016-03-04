# -*- mode: ruby -*-
# vi: set ft=ruby :

PRJ_DIR="/usr/src/local/project"
Vagrant.configure(2) do |config|
  config.vm.box = "ubuntu/trusty64"

  config.vm.provider "virtualbox" do |vb|
    vb.memory = "2048"
  end

  config.vm.network "forwarded_port", guest: 8080, host: 8081

  config.vm.synced_folder "./", PRJ_DIR

  # this is a hack because for some reason ansible_local wants to 'cd /vagrant' although I do not have that dir
  config.vm.provision "shell", inline: "mkdir -p /vagrant"
  config.vm.provision "shell", inline: "command -v git > /dev/null 2>&1 || apt-get update && apt-get install -y git"
  config.vm.provision "shell", inline: "apt-get install -y python-pip && pip install --upgrade pip"
  config.vm.provision "shell", inline: "apt-get purge -y python-pip && pip install --upgrade pip && pip install --upgrade ansible==1.9.4"

  config.vm.provision "ansible_local" do |a|
    a.playbook = "#{PRJ_DIR}/ansible/playbook.yml"
    a.verbose = true
    #a.install = true #install ansible if not available
    a.galaxy_role_file = "#{PRJ_DIR}/ansible/galaxy.yml"
  end
end
