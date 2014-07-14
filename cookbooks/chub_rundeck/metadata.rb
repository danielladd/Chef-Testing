name             'chub_rundeck'
maintainer       'CommerceHub Inc.'
maintainer_email 'lzarou@commercehub.com'
license          'Apache 2.0'
description      'Installs/Configures chub_rundeck'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '0.1.16'

depends "rundeck"
depends "mysql"
depends "database"
