# CHANGELOG for unix_chef_client_upgrade

This file is used to list changes made in each version of chef_client_upgrade

## 0.4.1:

The chef-client run needs to end after the upgrade.  Downstream things fail when
the version changes mid run.

## 0.4.0:

Rename to unix_chef_client_upgrade and remove the windows support.

## 0.3.7:

Fixed the solaris recipe so that the upgrade works.
Updated to use 11.12.8-2 version of chef.

## 0.3.5:

Removed Nexus rpm attribute. Added initial support for Solaris (9 and 10). Created solaris.rb, nocheck.erb (template)

## 0.3.4:

* Using yum packages on Satellite server instead of Nexus.

## 0.1.0:

* Initial release of chef_client_upgrade

- - - 
Check the [Markdown Syntax Guide](http://daringfireball.net/projects/markdown/syntax) for help with Markdown.

The [Github Flavored Markdown page](http://github.github.com/github-flavored-markdown/) describes the differences between markdown on github and standard markdown.
