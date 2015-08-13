# -*- mode: ruby -*-
# vi: set ft=ruby :

# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.
Vagrant.configure(2) do |config|
  config.vm.box = "chef/centos-6.6"

  config.vm.network "private_network", ip: "192.168.33.11"
  config.vm.provision :shell, privileged: false, inline: <<-SCRIPT
    if ! [ `which ansible` ]; then
       wget http://dl.fedoraproject.org/pub/epel/RPM-GPG-KEY-EPEL-6
       sudo rpm --import RPM-GPG-KEY-EPEL-6
       wget http://dl.fedoraproject.org/pub/epel/6/x86_64/epel-release-6-8.noarch.rpm
       sudo rpm -ivh epel-release-6-8.noarch.rpm
       sudo yum install -y ansible
    fi

    echo '192.168.33.11' > /home/vagrant/hosts
    export ANSIBLE_HOST_KEY_CHECKING=False

    echo '\n'
    echo 'Now ansible provisioning. Plaase waiting.'
    ansible-playbook -i /home/vagrant/hosts /vagrant/playbook/shogi.yml --private-key=/vagrant/.vagrant/machines/default/virtualbox/private_key
  SCRIPT
end
