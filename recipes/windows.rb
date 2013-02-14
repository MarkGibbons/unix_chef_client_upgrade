#
# Cookbook Name:: chef-client-upgrade
# Recipe:: windows
#
# Copyright 2013, Nordstrom, Inc.
#
# All rights reserved - Do Not Redistribute

nexus        = data_bag_item('shared', 'nexus')
version      = node["chef-client-upgrade"]["version"]
package_name = node["chef-client-upgrade"]["windows-package-name"]
installer    = "chef-client-#{version}.msi"
url          = node["chef-client-upgrade"]["url"]
source_url   = "#{nexus["url"]}/#{url}/#{version}/#{installer}"

windows_package package_name do
  source source_url
  checksum node["chef-client-upgrade"]["msi_checksum"]
end
