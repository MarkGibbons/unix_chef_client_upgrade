# encoding: utf-8
# Cookbook Name:: chef-client-upgrade
# Recipe:: linux
#
# Copyright 2013, 2014 Nordstrom, Inc.
#
# All rights reserved - Do Not Redistribute
#

yum_package node[:chef_client_upgrade][:pkg_name] do
  action :install
  version node[:chef_client_upgrade][:chef_pkg_version]
end
