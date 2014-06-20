# encoding: utf-8
# Cookbook Name:: chef-client-upgrade
# Attributes: default
#
# Copyright 2013, Nordstrom, Inc.
#
# All rights reserved - Do Not Redistribute

default[:chef_client_upgrade][:pkg_name]     = 'chef'
case node[:os]
when 'windows'
  default[:chef_client_upgrade][:url]          = 'com/opscode/chef/chef-client'
  default[:chef_client_upgrade][:msi_checksum] = 'c85e1606ce20eb5008e91b0dd218f325600567b18c453c1eeea71aba241d3566'
  default[:chef_client_upgrade][:version]      = '11.4.0-1'
  default[:chef_client_upgrade][:display_name] = 'Opscode Chef Client Installer for Windows v11.4.0'
  default[:chef_client_upgrade][:ohai_chef_vs] = '11.4.0'

when 'linux'
  rhel = "el#{platform_version.to_i}"
  default[:chef_client_upgrade][:chef_rhel_release] = '2'
  default[:chef_client_upgrade][:chef_rhel_version] = '11.12.8'
  default[:chef_client_upgrade][:chef_pkg_version] =
    "#{node[:chef_client_upgrade][:chef_rhel_version]}-#{node[:chef_client_upgrade][:chef_rhel_release]}.#{rhel}"

when 'solaris2'
  default[:chef_client_upgrade][:chef_solaris_release] = '2'
  default[:chef_client_upgrade][:chef_solaris_version] = '11.12.8'
  type = %w(sun4v sun4u).include?(node[:kernel][:machine]) ? 'sparc' : 'x86'
  default[:chef_client_upgrade][:solaris_pkg] = "chef-#{node[:chef_client_upgrade][:chef_solaris_version]}-#{node[:chef_client_upgrade][:chef_solaris_release]}.solaris2.#{node[:platform_version]}.#{type}"
  default[:chef_client_upgrade][:solaris_pkg_path] =
    File.join(node[:httpdistro][:dir], node[:chef_client_upgrade][:solaris_pkg])
  default[:chef_client_upgrade][:optpkg] = "-a #{node[:solaris_pkg][:nocheck]}"
  default[:chef_client_upgrade][:optpkg] << ' -G' if node[:kernel][:release] == '5.10'
end
