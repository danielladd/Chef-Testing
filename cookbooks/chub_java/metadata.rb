name             'chub_java'
maintainer       'CommerceHub'
maintainer_email ''
license          'All rights reserved'
description      'Installs/Configures chub_java'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '0.1.1'

depends 'java', '= 1.22.0'
depends 'windows', '~> 1.30.0'

supports 'ubuntu'
supports 'windows'
