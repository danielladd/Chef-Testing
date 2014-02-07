name             'chub-plaza'
maintainer       'David M. Carr'
maintainer_email 'dcarr@commercehub.com'
license          'All rights reserved'
description      'Installs/Configures Plaza'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '0.1.1'

supports "ubuntu"
depends "apt"
depends "java"

attribute "chub-plaza/app_url",
    :display_name => "Plaza application URL",
    :description => "URL from which to obtain the application JAR; can use a remote URL",
    :required => "optional",
    :default => "http://mpbamboo.nexus.commercehub.com/browse/SSO-PLAZA/latestSuccessful/artifact/shared/plaza.jar/plaza.jar"

attribute "chub-plaza/java_heap_size",
    :display_name => "Plaza Java heap size",
    :description => "The heap size with which to run the Plaza JVM",
    :required => "optional",
    :default => "512M"

attribute "chub-plaza/cas_server_url",
    :display_name => "CAS Server URL",
    :description => "The root URL of a CAS instance to use for SSO",
    :required => "required"

attribute "chub-plaza/cas_service_url",
    :display_name => "CAS Service URL",
    :description => "The service URL to pass to CAS (should end in /shiro-cas)",
    :required => "required"

attribute "graphite/host", :required => "recommended"
attribute "graphite/port", :required => "optional"
