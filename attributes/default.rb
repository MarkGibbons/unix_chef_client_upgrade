# encoding: utf-8
# Cookbook Name:: unix_chef_client_upgrade
# Attributes: default
#
# Copyright (C) 2013,2014 Nordstrom, Inc.
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
  if node[:os_version] == '5.11'
    default[:unix_chef_client_upgrade][:chef_solaris_release] = '1'
    default[:unix_chef_client_upgrade][:chef_solaris_version] = '11.16.4'
  else
    default[:unix_chef_client_upgrade][:chef_solaris_release] = '2'
    default[:unix_chef_client_upgrade][:chef_solaris_version] = '11.12.8'
  end
  type = %w(pc).include?(node[:kernel][:machine]) ? 'x86' : 'sparc'
  default[:unix_chef_client_upgrade][:solaris_pkg] = "chef-#{node[:unix_chef_client_upgrade][:chef_solaris_version]}-#{node[:unix_chef_client_upgrade][:chef_solaris_release]}.solaris2.#{node[:platform_version]}.#{type}"
  default[:unix_chef_client_upgrade][:solaris_pkg_path] =
    File.join(node[:httpdistro][:dir], node[:unix_chef_client_upgrade][:solaris_pkg])
  default[:unix_chef_client_upgrade][:optpkg] = "-a #{node[:solaris_pkg][:nocheck]}"
  default[:unix_chef_client_upgrade][:optpkg] << ' -G' if node[:kernel][:release] == '5.10'
end
