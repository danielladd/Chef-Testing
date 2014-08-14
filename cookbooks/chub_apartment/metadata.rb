name             "chub_apartment"
maintainer       "Alan DiStasio"
maintainer_email "adistasio@gavant.com"
license          "All rights reserved"
description      "Installs/Configures chub_apartment"
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          "0.1.0"

depends "apt"
depends "chub_java"
depends "chub_sensu"