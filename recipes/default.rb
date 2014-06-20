# encoding: utf-8
# Cookbook Name:: chef-client-upgrade
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
when 'windows'
  include_recipe "#{cookbook_name}::windows"
end
