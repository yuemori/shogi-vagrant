# -*- mode: ruby -*-
# vi: set ft=ruby :

# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.
Vagrant.configure(2) do |config|
  config.vm.box = "chef/centos-6.6"

  config.vm.define :ansible do |server|
    server.vm.network "private_network", ip: "192.168.33.11"
    config.vm.provision :shell, privileged: false, inline: <<-SCRIPT
      sudo yum install -y epel-release
      sudo yum install -y ansible
      sudo touch /home/vagrant/hosts
      sudo chown vagrant /home/vagrant/hosts
      echo '192.168.33.12' > /home/vagrant/hosts
      export ANSIBLE_HOST_KEY_CHECKING=False
      ansible-playbook -i /home/vagrant/hosts /vagrant/playbook/shogi.yml --private-key=/vagrant/.vagrant/machines/shogi/virtualbox/private_key
    SCRIPT
  end

  config.vm.define :shogi do |server|
    server.vm.network "private_network", ip: "192.168.33.12"
  end
end
