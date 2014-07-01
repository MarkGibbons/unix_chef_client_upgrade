# encoding: utf-8
# Cookbook Name:: unix_chef_client_upgrade
# Attributes: default
#
# Copyright 2013, Nordstrom, Inc.
#
# All rights reserved - Do Not Redistribute

default[:unix_chef_client_upgrade][:pkg_name] = 'chef'
case node[:os]
when 'linux'
  rhel = "el#{platform_version.to_i}"
  default[:unix_chef_client_upgrade][:chef_rhel_release] = '2'
  default[:unix_chef_client_upgrade][:chef_rhel_version] = '11.12.8'
  default[:unix_chef_client_upgrade][:chef_pkg_version] =
    "#{node[:unix_chef_client_upgrade][:chef_rhel_version]}-#{node[:unix_chef_client_upgrade][:chef_rhel_release]}.#{rhel}"

when 'solaris2'
  default[:unix_chef_client_upgrade][:chef_solaris_release] = '2'
  default[:unix_chef_client_upgrade][:chef_solaris_version] = '11.12.8'
  type = %w(sun4v sun4u).include?(node[:kernel][:machine]) ? 'sparc' : 'x86'
  default[:unix_chef_client_upgrade][:solaris_pkg] = "chef-#{node[:unix_chef_client_upgrade][:chef_solaris_version]}-#{node[:unix_chef_client_upgrade][:chef_solaris_release]}.solaris2.#{node[:platform_version]}.#{type}"
  default[:unix_chef_client_upgrade][:solaris_pkg_path] =
    File.join(node[:httpdistro][:dir], node[:unix_chef_client_upgrade][:solaris_pkg])
  default[:unix_chef_client_upgrade][:optpkg] = "-a #{node[:solaris_pkg][:nocheck]}"
  default[:unix_chef_client_upgrade][:optpkg] << ' -G' if node[:kernel][:release] == '5.10'
end
