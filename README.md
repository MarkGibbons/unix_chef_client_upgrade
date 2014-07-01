Description
===========

Upgrade the chef_client

Linux    - RedHat    - uses packages on Satellite server
Unix     - Solaris   - upgrades chef client

Requirements
============

Linux    - RedHat    - Server should be registered with Satellite server
Solaris  - 9 & 10    - An http file server must be available

Attributes
==========

["unix_chef_client_upgrade"]["version"]      = Latest version of Chef package
["unix_chef_client_upgrade"]["pkg_name"]     = Name called by package resource
["unix_chef_client_upgrade"]["ohai_chef_vs"] = Chef version in Ohai
["unix_chef_client_upgrade"]["pkg_path"]     = Path to package for Solaris
["unix_chef_client_upgrade"]["nocheck"]      = Enables non-interactive pkgadd

Usage
=====

Add chef_client_upgrade to the node's run list.
