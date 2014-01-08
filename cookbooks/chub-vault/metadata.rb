name             'chub-vault'
maintainer       'David M. Carr'
maintainer_email 'dcarr@commercehub.com'
license          'All rights reserved'
description      'Installs/Configures chub-vault'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '0.1.0'

supports "ubuntu"
depends "apt"
depends "java"

attribute "chub-vault/app_url",
    "display_name" => "vault application URL",
    "description" => "URL from which to obtain the application JAR; can use a remote URL",
    "default" => "http://mpbamboo.nexus.commercehub.com/browse/SSO-VAULT/latestSuccessful/artifact/shared/vault-shadow.jar/vault-shadow.jar"

attribute "chub-vault/java_heap_size",
    "display_name" => "vault Java heap size",
    "description" => "The heap size with which to run the vault JVM",
    "default" => "512M"
