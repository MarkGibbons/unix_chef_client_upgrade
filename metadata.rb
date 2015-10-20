# encoding: utf-8
name 'unix_chef_client_upgrade'
maintainer 'Nordstrom, Inc.'
maintainer_email 'itunixadminall@nordstrom.com'
description 'Upgrades the Chef client'
license 'Apache2 licence as specified in the License file.'
version '1.1.1'

depends 'solaris_pkg', '>= 0.1.2'
depends 'http_distro'
supports 'rhel'
supports 'solaris'
