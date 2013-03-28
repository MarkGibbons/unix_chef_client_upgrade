#
# Cookbook Name:: chef-client-upgrade
# Recipe:: linux
#
# Copyright 2013, Nordstrom, Inc.
#
# All rights reserved - Do Not Redistribute

nexus = data_bag_item('shared', 'nexus')

chef_version = node['chef-client-upgrade']['version']
distro = "el5"
arch = "#{node[:kernel][:machine]}"
chef_file = "chef-#{chef_version}.#{distro}.#{arch}.rpm"
nexus_root = "http://mvnrepo.nordstrom.net/nexus/content/repositories/thirdparty/RPM/chef/"
# http://mvnrepo.nordstrom.net/nexus/content/groups/public
# /com/opscode/chef/chef-client/11.4.0/chef-client-11.4.0-1.el5.x86_64.rpm

checksum = node['chef-client-upgrade']['rpm_checksum']

Chef::Log.info "nexus: #{nexus['url']}"

chef_client_source_url = ::File.join(nexus['url'], node["chef-client-upgrade"]["url"],
                                     chef_version,
                                     "chef-client-#{chef_version}-#{distro}.#{arch}.rpm")

Chef::Log.info "Source URL: #{chef_client_source_url}"

remote_file "#{Chef::Config[:file_cache_path]}/#{chef_file}" do
  source chef_client_source_url
  mode "644"
  checksum checksum
end

package "chef-client" do
  action :install
  source "#{Chef::Config[:file_cache_path]}/#{chef_file}"
  provider Chef::Provider::Package::Rpm
end

