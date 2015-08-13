require 'spec_helper'
require 'yaml'

if os[:family] == 'redhat'
  describe('mysql') do
    vars = YAML.load_file(ENV['ROLES_ROOT'] + '/mysql/vars/main.yml')

    describe command('mysqladmin --version') do
      its(:stdout) { should match(/Distrib #{vars['mysql_version']}/) }
    end

    describe service('mysqld') do
      it { should be_enabled }
      it { should be_running }
    end

    describe 'users' do
      vars['mysql_users'].each do |user|
        describe command("mysqlshow -u#{user['name']} -p#{user['password']}") do
          its(:exit_status) { should eq 0 }
        end
      end
    end
  end
end
