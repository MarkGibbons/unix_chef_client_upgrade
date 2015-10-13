# CHANGELOG for unix_chef_client_upgrade

This file is used to list changes made in each version of chef_client_upgrade

## 1.1.0
* Fix typo in chef-full package name.

## 1.1.0
* Change the solaris install to install on all local zones when the global zone is updated.
* Delete the old cheffull package from Solaris servers

## 1.0.1
* Change the solaris install to use separate resource names for remove and install.

## 1.0.0
* Change the minimum chef version to 12.4.1

## 0.5.1:
* Verify that the version is semver compatibile. 3 part all numeric.

## 0.5.0:
* Added the test kitchen framework.  Set up tests and got the install to work.
* Changed so that chef is upgraded and never downgraded.

## 0.4.4:
* Solaris 11 attributes added; package provider explicitly set to Solaris (until IPS server available)

## 0.4.3:
* Change the default solaris architecture to sparc for those cases where node[:kernel][:machine] is not defined.

## 0.4.2:
* The package remove before install is not needed with a change to the answer
file.

## 0.4.1:
* The chef-client run needs to end after the upgrade.  Downstream things fail when the version changes mid run.

## 0.4.0:
* Rename to unix_chef_client_upgrade and remove the windows support.

## 0.3.7:
* Fixed the solaris recipe so that the upgrade works.
* Updated to use 11.12.8-2 version of chef.

## 0.3.5:
* Removed Nexus rpm attribute. Added initial support for Solaris (9 and 10).
* Created solaris.rb, nocheck.erb (template)

## 0.3.4:
* Using yum packages on Satellite server instead of Nexus.

## 0.1.0:
* Initial release of chef_client_upgrade

- - -
Check the [Markdown Syntax Guide](http://daringfireball.net/projects/markdown/syntax) for help with Markdown.

The [Github Flavored Markdown page](http://github.github.com/github-flavored-markdown/) describes the differences between markdown on github and standard markdown.
