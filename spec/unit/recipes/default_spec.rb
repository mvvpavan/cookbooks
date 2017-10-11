#
# Cookbook:: common_packages
# Spec:: default
#
# Copyright:: 2017, The Authors, All Rights Reserved.

require 'spec_helper'

describe 'common_packages::default' do
  context 'When all attributes are default, on an Ubuntu 16.04' do
    let(:chef_run) do
      # for a complete list of available platforms and versions see:
      # https://github.com/customink/fauxhai/blob/master/PLATFORMS.md
      runner = ChefSpec::ServerRunner.new(platform: 'ubuntu', version: '16.04')
      runner.converge(described_recipe)
    end

    it 'converges successfully' do
      expect { chef_run }.to_not raise_error
    end
	it "should updgate and upgrade" do
	      expect(chef_run).to run_execute('apt-get update && apt-get upgrade -y')
	end
	
     it 'should install package apache' do
        expect(chef_run).to install_package('apache2')
    end 
     it 'should start apache2' do
       expect(chef_run).to start_service('apache2')
      end
  end
   
end
