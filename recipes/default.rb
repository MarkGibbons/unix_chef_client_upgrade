#
# Cookbook Name:: chef-client-upgrade
# Recipe:: default
#
# Copyright 2013, Nordstrom, Inc.
#
# All rights reserved - Do Not Redistribute

case node['os']
when "linux"
  include_recipe "chef-client-upgrade::linux"
when "solaris2"
  include_recipe "chef-client-upgrade::solaris"
when "windows"
  include_recipe "chef-client-upgrade::windows"
end