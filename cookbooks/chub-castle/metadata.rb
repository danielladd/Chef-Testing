name             'chub-castle'
maintainer       'David M. Carr'
maintainer_email 'dcarr@commercehub.com'
license          'All rights reserved'
description      'Installs/Configures chub-castle'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '0.1.2'

supports "ubuntu"
depends "apt"
depends "java"

attribute "chub-castle/app_url",
    "display_name" => "Castle application URL",
    "description" => "URL from which to obtain the application WAR; can use a remote URL",
    "default" => "http://mpbamboo.nexus.commercehub.com/browse/SSO-CAS/latestSuccessful/artifact/shared/castle.war/castle.war"

attribute "chub-castle/java_heap_size",
    "display_name" => "Castle Java heap size",
    "description" => "The heap size with which to run the Castle JVM",
    "default" => "512M"

attribute "chub-castle/keystore_file",
    "display_name" => "Castle keystore file",
    "description" => "The cookbook file to use as the keystore",
    "default" => "keystore.jks"

attribute "chub-castle/truststore_file",
    "display_name" => "Castle truststore file",
    "description" => "The cookbook file to use as the truststore",
    "default" => "truststore.jks"

attribute "chub-castle/keystore_password",
    "display_name" => "Castle keystore password",
    "description" => "The password to use with the keystore",
    "default" => "changeit"

attribute "chub-castle/truststore_password",
    "display_name" => "Castle truststore password",
    "description" => "The password to use with the truststore",
    "default" => "changeit"
