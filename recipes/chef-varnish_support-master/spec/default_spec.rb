require 'chefspec'
require 'spec_helper'
require 'fauxhai'




describe 'varnish_support::default' do
    let(:chef_run) do
    ChefSpec::SoloRunner.new do
    end.converge(described_recipe)
end

 it 'includes the `iptables` recipe' do
    expect(chef_run).to include_recipe('iptables::default')
 end

 it 'includes the `varnish` recipe' do
	expect(chef_run).to include_recipe('varnish::default')
 end

 it 'creates iptables rule file' do
    expect(chef_run).to render_file('/etc/iptables.d/varnish')
  end
end
