name             'chub_castle'
maintainer       'David M. Carr'
maintainer_email 'dcarr@commercehub.com'
license          'All rights reserved'
description      'Installs/Configures chub_castle'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '0.1.19'

supports "ubuntu"
depends "apt"
depends "chub_java"
depends "hostsfile"

attribute "chub_castle/app_url",
    :display_name => "Castle application URL",
    :description => "URL from which to obtain the application WAR; can use a remote URL",
    :default => "http://mpbamboo.nexus.commercehub.com/browse/SSO-CAS/latestSuccessful/artifact/shared/castle.war/castle.war",
    :required => "optional"

attribute "chub_castle/java_heap_size",
    :display_name => "Castle Java heap size",
    :description => "The heap size with which to run the Castle JVM",
    :default => "512M",
    :required => "optional"

attribute "chub_castle/keystore_file",
    :display_name => "Castle keystore file",
    :description => "The cookbook file to use as the keystore",
    :default => "keystore.jks",
    :required => "optional"

attribute "chub_castle/truststore_file",
    :display_name => "Castle truststore file",
    :description => "The cookbook file to use as the truststore",
    :default => "truststore.jks",
    :required => "optional"

attribute "chub_castle/keystore_password",
    :display_name => "Castle keystore password",
    :description => "The password to use with the keystore",
    :default => "changeit",
    :required => "optional"

attribute "chub_castle/truststore_password",
    :display_name => "Castle truststore password",
    :description => "The password to use with the truststore",
    :default => "changeit",
    :required => "optional"

attribute "chub_castle/forgot_password_url",
    :display_name => "Forgot password URL",
    :description => "URL for users who forgot their password",
    :required => "required"

attribute "chub_castle/vault_url",
    :display_name => "Vault Server URL",
    :description => "Vault server for Castle to connect to",
    :required => "required"

attribute "chub_castle/hazelcast/group",
    :display_name => "Hazelcast Group",
    :description => "Name of Hazelcast Cluster",
    :required => "optional"

attribute "chub_castle/hazelcast/password",
    :display_name => "Hazelcast Password",
    :description => "Password for Hazelcast Cluster",
    :required => "required"

attribute "chub_castle/hazelcast/network_port",
    :display_name => "Hazelcast Network Port",
    :description => "Port for Hazelcast Cluster",
    :required => "optional"

attribute "chub_castle/hazelcast/multicast_group",
    :display_name => "Hazelcast Multicast Group",
    :description => "Address of hazelcast cluster multicast group",
    :required => "optional"

attribute "chub_castle/hazelcast/multicast_port",
    :display_name => "Hazelcast Multicast Port",
    :description => "Port for hazelcast cluster multicast group",
    :required => "optional"

attribute "chub_castle/hazelcast/backup_count",
    :display_name => "Hazelcast Backup Count",
    :description => "Number of backups for hazelcast cluster",
    :required => "optional"

attribute "chub_castle/hazelcast/service_ticket_timeout",
    :display_name => "Service Ticket Timeout",
    :description => "Length in seconds of service ticket timeout",
    :required => "optional"

attribute "chub_castle/hazelcast/ticket_granting_ticket_timeout",
    :display_name => "Ticket Granting Ticket Timeout",
    :description => "Length in seconds of ticket granting ticket timeout",
    :required => "optional"

attribute "graphite/host",
    :display_name => "Graphite Host",
    :description => "Location of Graphite Server",
    :required => "optional"

attribute "graphite/port",
    :required => "optional"
