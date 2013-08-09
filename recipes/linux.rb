#
# Cookbook Name:: chef-client-upgrade
# Recipe:: linux
#
# Copyright 2013, Nordstrom, Inc.
#
# All rights reserved - Do Not Redistribute

package node['chef-client-upgrade']['pkg_name'] do
  action :upgrade
end