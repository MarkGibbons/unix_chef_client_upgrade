# encoding: utf-8
# Cookbook Name:: unix_chef_client_upgrade
# Recipe:: default
#
# Copyright 2013, 2014, 2015 Nordstrom, Inc.
#
# All rights reserved - Do Not Redistribute

unless VERSION =~ /\d+\.\d+\.\d+/
  Chef::Application.fatal!('Unexpected chef version format found while checking for upgrade.')
end
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
