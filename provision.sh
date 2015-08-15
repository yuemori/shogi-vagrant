#!/bin/bash

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
ansible-playbook -i /home/vagrant/hosts /vagrant/playbook/shogi.yml --private-key=/home/vagrant/private_key $1

if test $? -eq 0
then
  echo '\n'
  echo 'Install Complete!'
else
  echo '\n'
  echo 'Install Failed...'
fi
