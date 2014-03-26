name             'chub-castle'
maintainer       'David M. Carr'
maintainer_email 'dcarr@commercehub.com'
license          'All rights reserved'
description      'Installs/Configures chub-castle'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '0.1.16'

supports "ubuntu"
depends "apt"
depends "java", "~> 1.22.0"

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
    
attribute "chub-castle/vault.url",
    "display_name" => "Vault Server URL",
    "description" => "Vault server for Castle to connect to"

attribute "graphite/host",
    "display_name" => "Graphite Host",
    "description" => "Location of Graphite Server"

attribute "hazelcast/group",
    "display_name" => "Hazelcast Group",
    "description" => "Name of Hazelcast Cluster",
    :required => "required"

attribute "hazelcast/password",
    "display_name" => "Hazelcast Password",
    "description" => "Password for Hazelcast Cluster",
    :required => "required"

attribute "hazelcast/network-port",
    "display_name" => "Hazelcast Network Port",
    "description" => "Port for Hazelcast Cluster",
    :required => "optional"

attribute "hazelcast/multicast-group",
    "display_name" => "Hazelcast Multicast Group",
    "description" => "Address of hazelcast cluster multicast group",
    :required => "optional"

attribute "hazelcast/multicast-port",
    "display_name" => "Hazelcast Multicast Port",
    "description" => "Port for hazelcast cluster multicast group",
    :required => "optional"

attribute "hazelcast/backup-count",
    "display_name" => "Hazelcast Backup Count",
    "description" => "Number of backups for hazelcast cluster",
    :required => "optional"

attribute "hazelcast/stTimeout",
    "display_name" => "Service Ticket Timeout",
    "description" => "Length in seconds of service ticket timeout",
    :required => "required"

attribute "hazelcast/tgtTimeout",
    "display_name" => "Ticket Granting Ticket Timeout",
    "description" => "Length in seconds of ticket granting ticket timeout",
    :required => "required"                

attribute "graphite/port", :required => "optional"
