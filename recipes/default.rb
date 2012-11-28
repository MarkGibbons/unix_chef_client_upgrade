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
  checksum "0665393d6c1640e3cdf913e7dc93d281e5252efd4c134de884d0439504484454"
end

package "chef-client" do
  action :install
  source "#{Chef::Config[:file_cache_path]}/#{chef_file}"
  provider Chef::Provider::Package::Rpm
end

