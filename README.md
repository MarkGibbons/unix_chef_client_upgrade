Description
===========

Upgrade the chef_client

Linux    - RedHat    - uses packages on Satellite server
Unix     - Solaris   - upgrades chef client

Requirements
============

Linux    - RedHat    - Server should be registered with Satellite server
Solaris  - 9,10,11   - An http file server must be available

Attributes
==========

["unix_chef_client_upgrade"]["version"]      = Latest version of Chef package
["unix_chef_client_upgrade"]["pkg_name"]     = Name called by package resource
["unix_chef_client_upgrade"]["ohai_chef_vs"] = Chef version in Ohai
["unix_chef_client_upgrade"]["pkg_path"]     = Path to package for Solaris
["unix_chef_client_upgrade"]["nocheck"]      = Enables non-interactive pkgadd

Testing
=======

The tests consist of installing a version of chef using omnibus and then running
the cookbook.  We verify that the correct version is installed after testing.
The action of killing the chef run after an upgrade is suppressed to that test
kitchen will mark the converge runs as successful.

As of 8/1/2015 a few special actions are needed to test.  

Rhel 5 fails with an error in yum processing. The error appears to be related to
the cut over to y0319p973 as the satellite server.  Plans are in place to
reimport packages.

Before doing Solaris 10 tests the chef package needs to be deleted so that
omnibus can install the appropriate level.  Our Solaris 10 image come packaged
with chef 11.4.1 which doesn't support chef-zero and causes all sort of
problems.

Usage
=====

Add chef_client_upgrade to the node's run list.
