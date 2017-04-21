require 'chefspec'
require_relative 'spec_helper'

describe 'ele-poller::default' do
  before { stub_resources }

  let(:chef_run) { ChefSpec::SoloRunner.new.converge(described_recipe) }

  it 'installs package' do
    expect(chef_run).to install_package('vim-tiny')
  end
end
