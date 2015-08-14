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

    export ANSIBLE_HOST_KEY_CHECKING=False
    sudo cp -rf /vagrant/.vagrant/machines/default/virtualbox/private_key /home/vagrant/private_key
    sudo chown vagrant /home/vagrant/private_key
    sudo chmod 600 /home/vagrant/private_key

    sudo cp -rf /vagrant/playbook/hosts /home/vagrant/hosts
    sudo chmod 644 /home/vagrant/hosts

    echo '\n'
    echo 'Now ansible provisioning. Plaase waiting.'
    ansible-playbook -i /home/vagrant/hosts /vagrant/playbook/shogi.yml --private-key=/home/vagrant/private_key

    if test $? -eq 0
    then
      echo '\n'
      echo 'Install Complete!'
    else
      echo '\n'
      echo 'Install Failed...'
    fi
  SCRIPT
end
