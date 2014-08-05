name             'chub_mc_app'
maintainer       'CommerceHub Inc.'
maintainer_email 'lkulzer@commercehub.com'
license          'Apache 2.0'
description      'Installs/Configures chub-missioncontrol'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '0.2.0'

depends 'chub_java'
depends 'tomcat'
depends 'chub_sensu'
