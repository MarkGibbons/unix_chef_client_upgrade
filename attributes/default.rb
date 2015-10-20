# encoding: utf-8
# Cookbook Name:: unix_chef_client_upgrade
# Attributes: default
#
# Copyright (C) 2013,2014,2015 Nordstrom, Inc.
#
# Licensed for use with the Apache2 license

default['unix_chef_client_upgrade']['pkg_name'] = 'chef'
default['unix_chef_client_upgrade']['kill_after_install'] = true
case node['os']
when 'linux'
  rhel = "el#{platform_version.to_i}"
  default['unix_chef_client_upgrade']['chef_release'] = '-1'
  default['unix_chef_client_upgrade']['chef_version'] = '12.4.1'
  default['unix_chef_client_upgrade']['chef_pkg'] =
    "#{node['unix_chef_client_upgrade']['chef_version']}#{node['unix_chef_client_upgrade']['chef_release']}.#{rhel}"

when 'solaris2'
  if node['os_version'] == '5.11'
    default['unix_chef_client_upgrade']['chef_release'] = '-1'
    default['unix_chef_client_upgrade']['chef_version'] = '12.4.1'
  else
    default['unix_chef_client_upgrade']['chef_release'] = '-1'
    default['unix_chef_client_upgrade']['chef_version'] = '12.4.1'
  end
  type = %w(pc i86pc x64).include?(node['kernel']['machine']) ? 'i86pc' : 'sparc'
  default['unix_chef_client_upgrade']['chef_pkg'] = "chef-#{node['unix_chef_client_upgrade']['chef_version']}#{node['unix_chef_client_upgrade']['chef_release']}.solaris2.#{node['platform_version']}.#{type}"
  default['unix_chef_client_upgrade']['solaris_pkg_path'] =
    File.join(node['httpdistro']['dir'], node['unix_chef_client_upgrade']['chef_pkg'])
  default['unix_chef_client_upgrade']['optpkg'] = "-a #{node['solaris_pkg']['nocheck']}"
  # Turn off current zone only.  Install in the local zones when updating the global zone.
  # Set current_zone_only to -G to install only in the current zone
  # pkgrm will continue to delete the old chef client from all zones however
  default['unix_chef_client_upgrade']['current_zone_only'] = ''
end
