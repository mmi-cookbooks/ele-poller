# encoding: UTF-8
# License:: Apache License, Version 2.0
#

require_relative 'spec_helper'

describe package('vim-tiny') do
  it { should be_installed }
end
