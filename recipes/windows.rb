# encoding: utf-8
# Cookbook Name:: chef-client-upgrade
# Recipe:: windows
#
# Copyright 2013, 2014 Nordstrom, Inc.
#
# All rights reserved - Do Not Redistribute

nexus        = data_bag_item('shared', 'nexus')
version      = node[:chef_client_upgrade][:version]
package_name = node[:chef_client_upgrade][:display_name]
installer    = "chef_client_#{version}.msi"
url          = node[:chef_client_upgrade][:url]
source_url   = "#{nexus['url']}/#{url}/#{version}/#{installer}"

windows_package package_name do
  source source_url
  checksum node[:chef_client_upgrade][:msi_checksum]
end
