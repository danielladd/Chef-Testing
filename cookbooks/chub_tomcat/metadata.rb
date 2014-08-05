name             'chub_tomcat'
maintainer       'CommerceHub Inc.'
maintainer_email 'estegmann'
license          'Apache 2.0'
description      'Installs/Configures Apache Tomcat using the version of tomcat stored in artifactory linked in default.rb of this cookbook if the platform is windows, uses default tomcat cookbook for non-windows servers.'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '0.1.0'
depends 		 'tomcat'