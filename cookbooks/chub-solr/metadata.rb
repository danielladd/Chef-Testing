name             'chub-solr'
maintainer       'CommerceHub Inc.'
maintainer_email 'wgrunenwald@commercehub.com'
license          'Apache 2.0'
description      'Installs/Configures chub-solr'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version '0.2.0'

depends "chub_java"
depends "tomcat"
depends "openssl"