# encoding: utf-8
# Cookbook Name:: unix_chef_client_upgrade
# Recipe:: default
#
# Copyright 2013, 2014 Nordstrom, Inc.
#
# All rights reserved - Do Not Redistribute

case node[:os]
when 'linux'
  include_recipe "#{cookbook_name}::linux"
when 'solaris2'
  include_recipe "#{cookbook_name}::solaris"
end
