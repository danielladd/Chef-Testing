name 				'base'
maintainer			'CommerceHub'
maintainer_email	'YOUR_EMAIL'
license				'Apache 2.0'
description			'Installs/Configures base'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version				'0.1.18'
depends             "apt"
depends				"git"
depends				"chef-client"
depends				"ntp"
depends				"chef-kick"
depends             "mercurial"
depends             "ssh-keys"
depends             "hostsfile", "= 2.4.4"