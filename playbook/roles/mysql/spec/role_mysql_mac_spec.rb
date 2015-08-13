require 'spec_helper'

# MacOS
if os[:family] == 'darwin'
  describe 'mysql' do
    describe command('brew list | grep mysql55') do
      let(:disable_sudo) { true }
      its(:exit_status) { should eq 0 }
    end

    describe file("#{ENV['HOME']}/Library/LaunchAgents/homebrew.mxcl.mysql55.plist") do
      let(:disable_sudo) { true }
      it { should be_file }
    end

    describe command('launchctl list | grep mysql55') do
      let(:disable_sudo) { true }
      its(:exit_status) { should eq 0 }
    end
  end
end
