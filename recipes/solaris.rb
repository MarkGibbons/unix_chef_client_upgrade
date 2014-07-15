# Encoding: utf-8
# Cookbook Name:: unix_chef_client_upgrade
# Recipe:: solaris
#
# Copyright 2013, 2014 Nordstrom, Inc.
#
# All rights reserved - Do Not Redistribute

include_recipe 'solaris_pkg'

chef_pkg = File.join(Chef::Config[:file_cache_path], node[:unix_chef_client_upgrade][:solaris_pkg])

remote_file chef_pkg do
  source node[:unix_chef_client_upgrade][:solaris_pkg_path]
  notifies :remove, 'package[remove_chef]', :immediately
  not_if { node[:chef_packages][:chef][:version] == node[:unix_chef_client_upgrade][:chef_solaris_version] }
end

# The first pkgrm will almost always fail, retry
package 'remove_chef' do
  package_name 'chef'
  action :nothing
  retries 2
end

package node[:unix_chef_client_upgrade][:pkg_name] do
  action :install
  source chef_pkg
  options node[:unix_chef_client_upgrade][:optpkg]
  not_if { node[:chef_packages][:chef][:version] == node[:unix_chef_client_upgrade][:chef_solaris_version] }
  notifies :create, 'ruby_block[chef-client-upgraded]', :immediately
end
