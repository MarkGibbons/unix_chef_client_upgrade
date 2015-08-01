# encoding: utf-8
# Cookbook Name:: unix_chef_client_upgrade
# Recipe:: default
#
# Copyright 2013, 2014 Nordstrom, Inc.
#
# All rights reserved - Do Not Redistribute

require 'chef/version_constraint'
current_version = Chef::Version.new(VERSION)
next_version = Chef::Version.new(node['unix_chef_client_upgrade']['chef_version'])

if next_version > current_version
  case node['os']
  when 'linux'
    include_recipe "#{cookbook_name}::linux"
  when 'solaris2'
    include_recipe "#{cookbook_name}::solaris"
  end
  include_recipe "#{cookbook_name}::upgraded"
end
