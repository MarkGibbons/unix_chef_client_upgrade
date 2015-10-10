# Cookbook Name:: unix_chef_client_upgrade
# Recipe:: solaris
#
# Copyright (C) 2013, 2014, 2015 Nordstrom, Inc.
#
# All rights reserved - Do Not Redistribute

include_recipe 'solaris_pkg'

chef_pkg = File.join(Chef::Config['file_cache_path'], node['unix_chef_client_upgrade']['chef_pkg'])

remote_file chef_pkg do
  source node['unix_chef_client_upgrade']['solaris_pkg_path']
end

package "remove chef-full" do
  package_name 'chef-full'
  provider Chef::Provider::Package::Solaris
  action :remove
  options node['unix_chef_client_upgrade']['optpkg']
  retries 5
end

package "remove #{node['unix_chef_client_upgrade']['pkg_name']}" do
  package_name 'chef'
  provider Chef::Provider::Package::Solaris
  action :remove
  options node['unix_chef_client_upgrade']['optpkg']
  retries 5
end

package "install #{node['unix_chef_client_upgrade']['pkg_name']}" do
  package_name 'chef'
  action :install
  source chef_pkg
  provider Chef::Provider::Package::Solaris
  options "#{node['unix_chef_client_upgrade']['optpkg']} #{node['unix_chef_client_upgrade']['current_zone_only']}"
  notifies :create, 'ruby_block[chef-client-upgraded]', :immediately
end
