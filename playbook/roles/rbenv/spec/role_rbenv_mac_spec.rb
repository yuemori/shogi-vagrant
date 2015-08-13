require 'spec_helper'
require 'yaml'


# MacOS
if os[:family] == 'darwin'
  ruby_version = YAML.load_file(File.expand_path(ENV['ROLES_ROOT'] + '/rbenv/vars/main.yml'))['ruby_version']

  describe 'rbenv' do
    describe command('brew list | grep rbenv') do
      let(:disable_sudo) { true }
      its(:exit_status) { should eq 0 }
    end

    describe command('brew list | grep ruby-build') do
      let(:disable_sudo) { true }
      its(:exit_status) { should eq 0 }
    end

    describe file('/usr/local/bin/rbenv') do
      it { should be_file }
    end

    describe('use rbenv command') do
      let(:pre_command) { 'source /usr/local/bin/rbenv' }
      let(:disable_sudo) { true }

      describe command('rbenv global') do
        its(:stdout) { should match(/^#{ruby_version}/) }
      end

      describe command("ruby -v | grep #{ruby_version}") do
        let(:path) { '~/.rbenv/shims:${PATH}' }
        its(:exit_status) { should eq 0 }
      end

      describe package('bundler') do
        let(:path) { "/Users/#{ENV['TARGET_USER']}/.rbenv/shims:${PATH}" }
        it { should be_installed.by(:gem) }
      end
    end
  end
end
