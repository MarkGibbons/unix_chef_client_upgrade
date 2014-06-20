# encoding: utf-8
name 'chef-client-upgrade'
maintainer 'Nordstrom, Inc.'
maintainer_email 'itunixadminall@nordstrom.com'
description 'upgrades the Chef client'
license 'All rights reserved'
version '0.3.7'

recommends 'windows', '~> 1.12.8'
depends 'solaris_pkg'
depends 'http_distro'
supports 'rhel'
supports 'solaris'
