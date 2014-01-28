name             'chub-plaza'
maintainer       'David M. Carr'
maintainer_email 'dcarr@commercehub.com'
license          'All rights reserved'
description      'Installs/Configures Plaza'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '0.1.0'

supports "ubuntu"
depends "apt"
depends "java"

attribute "chub-plaza/app_url",
    "display_name" => "Plaza application URL",
    "description" => "URL from which to obtain the application JAR; can use a remote URL",
    "default" => "http://mpbamboo.nexus.commercehub.com/browse/SSO-PLAZA/latestSuccessful/artifact/shared/plaza.jar/plaza.jar"

attribute "chub-plaza/java_heap_size",
    "display_name" => "Plaza Java heap size",
    "description" => "The heap size with which to run the Plaza JVM",
    "default" => "512M"

attribute "chub-plaza/cas_server_url",
    "display_name" => "CAS Server URL",
    "description" => "The root URL of a CAS instance to use for SSO"

attribute "chub-plaza/cas_service_url",
    "display_name" => "CAS Service URL",
    "description" => "The service URL to pass to CAS (should end in /shiro-cas)"

attribute "chub-plaza/graphite_host",
    "display_name" => "Graphite Host",
    "description" => "Graphite host for metrics reporting (optional)"

attribute "chub-plaza/graphite_port",
    "display_name" => "Graphite Port",
    "description" => "Graphite port",
    "default" => "2003"
