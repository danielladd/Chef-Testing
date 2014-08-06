name             'chub-buyspace'
maintainer       'CommerceHub Inc.'
maintainer_email 'aheiss@commercehub.com'
license          'Apache 2.0'
description      'Installs/Configures chub-buyspace'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '0.9.0'

depends "chub_java", "= 0.1.0"
depends "tomcat", "= 0.15.2"
depends "hostsfile", "= 2.4.4"
