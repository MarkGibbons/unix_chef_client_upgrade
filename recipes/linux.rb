# encoding: utf-8
# Cookbook Name:: unix_chef_client_upgrade
# Recipe:: linux
#
# Copyright 2013, 2014 Nordstrom, Inc.
#
# All rights reserved - Do Not Redistribute
#

yum_package node[:unix_chef_client_upgrade][:pkg_name] do
  action :install
  version node[:unix_chef_client_upgrade][:chef_pkg_version]
  notifies :create, 'ruby_block[chef-client-upgraded]', :immediately
end
