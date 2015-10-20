# encoding: utf-8
# Cookbook Name:: unix_chef_client_upgrade
# Recipe:: linux
#
# Copyright 2013, 2014, 2015 Nordstrom, Inc.
#
# Licensed for use with the Apache2 license 
#

yum_package node['unix_chef_client_upgrade']['pkg_name'] do
  action :install
  version node['unix_chef_client_upgrade']['chef_pkg']
  ignore_failure true
  notifies :create, 'ruby_block[chef-client-upgraded]', :immediately
end
