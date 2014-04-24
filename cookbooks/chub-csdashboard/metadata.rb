name             'chub-csdashboard'
maintainer       'CommerceHub Inc.'
maintainer_email 'estegmann@commercehub.com'
license          'Apache 2.0'
description      'Installs/Configures chub-missioncontrol'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '0.1.0'

depends 'chub_java'
depends 'openssl'
depends 'ulimit'
depends 'mongodb'