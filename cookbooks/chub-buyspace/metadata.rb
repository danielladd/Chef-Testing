name             'chub-buyspace'
maintainer       'CommerceHub Inc.'
maintainer_email 'aheiss@commercehub.com'
license          'Apache 2.0'
description      'Installs/Configures chub-buyspace'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '0.2.2'

#depends "hostsfile", "= 2.4.4"
#depends "python", "= 1.3.6"
#depends "build-essential", "= 2.0.0"
#depends "windows", "= 1.11.0"
#depends "mercurial", "= 2.0.5"
#depends "apt", "= 2.1.1"
#depends "chef-kick", "= 0.1.0"
#depends "ntp", "= 1.5.4"
#depends "cron", "= 1.2.6"
#depends "chef-client", "= 3.0.6"
#depends "yum", "= 3.0.6"
#depends "yum-epel", "= 0.2.0"
#depends "runit", "= 1.2.0"
#depends "chef_handler", "= 1.1.4"
#depends "dmg", "="
#depends "git", "= 2.6.0"
#depends "base", "= 0.1.15"
#depends "hostsfile", "= 0.1.15"
#depends "openssl", "= 1.1.0"
#depends "java", "= 1.22.0"
#depends "tomcat", "= 0.15.2"
#depends "chub_java", "= 0.1.0"

depends "chub_java"
depends "tomcat"
depends "hostsfile", "= 2.4.4"
