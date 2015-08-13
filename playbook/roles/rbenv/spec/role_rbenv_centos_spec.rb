require 'spec_helper'
require 'yaml'

# CentOS
if os[:family] == 'redhat'
  ruby_version = YAML.load_file(File.expand_path(ENV['ROLES_ROOT'] + '/rbenv/vars/main.yml'))['ruby_version']

  describe 'rbenv' do
    describe 'dependencie packages' do
      %w(gcc-c++ glibc-headers libyaml-devel openssl-devel readline-devel zlib zlib-devel git).each do |package|
        describe package(package) do
          it { should be_installed }
        end
      end
    end

    describe file("/home/#{ENV['TARGET_USER']}/.rbenv/") do
      it { should be_directory }
    end

    describe file("/home/#{ENV['TARGET_USER']}/.rbenv/plugins/ruby-build") do
      it { should be_directory }
    end

    describe file('/etc/profile.d/rbenv.sh') do
      it { should be_file }
      it { should be_owned_by 'root' }
      it { should be_grouped_into 'root' }
      it { should be_mode 644 }
    end

    describe('use rbenv command') do
      let(:pre_command) { 'source /etc/profile.d/rbenv.sh' }
      let(:disable_sudo) { true }

      describe command('which rbenv') do
        its(:stdout) { should match(/\/home\/#{ENV['TARGET_USER']}\/.rbenv\/bin\/rbenv/) }
      end

      describe command('rbenv versions | rbenv global') do
        its(:stdout) { should match(/^2.1.2/) }
      end

      describe command("ruby -v | grep #{ruby_version}") do
        its(:exit_status) { should eq 0 }
      end

      describe package('bundler') do
        it { should be_installed.by(:gem) }
      end
    end
  end
end

