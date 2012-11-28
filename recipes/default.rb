#
# Cookbook Name:: client_upgrade
# Recipe:: default
#
# Copyright 2012, Nordstrom, Inc.
#
# All rights reserved - Do Not Redistribute


chef_version = "10.16.2-1"
distro = "el5"
arch = "#{node[:kernel][:machine]}"
chef_file = "chef-#{chef_version}.#{distro}.#{arch}.rpm"
nexus_root = "http://mvnrepo.nordstrom.net/nexus/content/repositories/thirdparty/RPM/chef/"

remote_file "#{Chef::Config[:file_cache_path]}/#{chef_file}" do
  source "#{nexus_root}/#{chef_version}.#{distro}.#{arch}/#{chef_file}"
  mode "644"
  checksum "0f08d4fda737d79fffb593822d7cc69d0248ce96"
end

package "chef-client" do
  action :install
  source "#{Chef::Config[:file_cache_path]}/#{chef_file}"
  provider Chef::Provider::Package::Rpm
end

