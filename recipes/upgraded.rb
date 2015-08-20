# encoding: utf-8
# Cookbook Name:: unix_chef_client_upgrade
# Recipe:: upgraded
#
# Copyright 2013, 2014, 2015 Nordstrom, Inc.
#
# All rights reserved - Do Not Redistribute

ruby_block 'chef-client-upgraded' do
  block do
    Chef::Application.fatal!('The chef client was upgraded.  Ending this chef run immediately.')
  end
  only_if { node['unix_chef_client_upgrade']['kill_after_install'] }
  action :nothing
end
