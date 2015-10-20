#
# Copyright (c) 2015 Nordstrom, Inc.
#
# Licensed for use with the Apache2 license
require 'spec_helper'

case host_inventory['hostname']
when 'default-updaterhel5-update'
  expected_version = '12.4.1'
when 'default-updaterhel6-current'
  expected_version = '12.4.1'
when 'default-updaterhel6-ahead'
  expected_version = '12.4.1'
when 'default-updaterhel6-update'
  expected_version = '12.4.1'
when 'default-updatesol10-update'
  expected_version = '12.4.1'
when 'default-updatesol11-update'
  expected_version = '12.4.1'
end

describe command('chef-client -v') do
  its(:stdout) { should match(/#{expected_version}/) }
end
