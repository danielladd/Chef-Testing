name             'chub_envdash'
maintainer       'CommerceHub'
maintainer_email ''
license          'All rights reserved'
description      'Installs/Configures chub_envdash'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '0.1.3'

supports "ubuntu"
depends "chub_java"

attribute "chub_envdash/app/url",
    :display_name => "Application URL",
    :description => "URL from which to obtain the application JAR; can use a remote URL",
    :required => "optional"

attribute "chub_envdash/title", :required => "required"
attribute "chub_envdash/prefix", :required => "required"
attribute "chub_envdash/environment_names", :required => "required"
attribute "chub_envdash/role_names", :required => "required"

attribute "chub_envdash/java_heap_size",
    :display_name => "Java heap size",
    :description => "Heap size with which to run the JVM",
    :required => "optional"
