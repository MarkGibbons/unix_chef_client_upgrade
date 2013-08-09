#
# Cookbook Name:: chef-client-upgrade
# Recipe:: solaris
#
# Copyright 2013, Nordstrom, Inc.
#
# All rights reserved - Do Not Redistribute

# Create nocheck - cannot install package non-interactively without this file
# Works on Solaris 5.10, what about 5.9?
template node['chef-client-upgrade']['nocheck'] do
  source "nocheck.erb"
  owner "root"
  group "root"
  mode 00744
  action :create
end

package node['chef-client-upgrade']['pkg_name'] do
  action :install
  source [node['chef-client-upgrade']['pkg_path'],'chef-',node['chef-client-upgrade']['version'],'.solaris2.',node['platform_version'],'_sparc.solaris'].join
  if node["platform_version"] == "5.10"
    options "-G -a /var/sadm/install/admin/nocheck"
  end
  not_if { node['chef_packages']['chef']['version'] == node['chef-client-upgrade']['ohai_chef_vs'] }
end