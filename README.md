Description
===========

Upgrade the chef-client

Linux    - RedHat    - uses packages on Satellite server
Unix     - Solaris   - upgrades chef client, but does not remove old one

Example:
xabv@x0319vt108 xabv $ sudo chef-client -v
Chef: 11.4.0

xabv@x0319vt108 xabv $ pkginfo | grep chef
application chef                           chef
application chef-full                      chef-full

Both 10.8 and 11.4 are present

TO DO: Add cleanup function

Requirements
============

Linux    - RedHat    - Server should be registered with Satellite server
Solaris  - 9 & 10    - /opt/admin must be mounted

Attributes
==========

["chef-client-upgrade"]["version"]      = Latest version of Chef package
["chef-client-upgrade"]["pkg_name"]     = Name called by package resource
["chef-client-upgrade"]["ohai_chef_vs"] = Chef version in Ohai
["chef-client-upgrade"]["pkg_path"]     = Path to package for Solaris
["chef-client-upgrade"]["nocheck"]      = Enables non-interactive pkgadd

Usage
=====

Add chef-client-upgrade to the node's run list.
