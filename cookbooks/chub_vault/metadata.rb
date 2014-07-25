name             'chub_vault'
maintainer       'David M. Carr'
maintainer_email 'dcarr@commercehub.com'
license          'All rights reserved'
description      'Installs/Configures Vault'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '0.4.0'

supports "ubuntu"
depends "chub_java"

attribute "chub_vault/app_url",
    :display_name => "Vault application URL",
    :description => "URL from which to obtain the application JAR; can use a remote URL",
    :required => "optional",
    :default => "http://mpbamboo.nexus.commercehub.com/browse/SSO-VAULT/latestSuccessful/artifact/shared/vault-server-shadow.jar/vault-server-shadow.jar"

attribute "chub_vault/ldap/base_dn",
    :display_name => "Base DN",
    :description => "Base distinguished name which contains all other LDAP entries",
    :required => "optional",
    :default => "dc=vault,dc=commercehub,dc=com"

attribute "chub_vault/ldap/user_ou",
    :display_name => "User OU",
    :description => "Organizational unit to contain Vault users; suffixed with the base_dn to form a DN",
    :required => "optional",
    :default => "ou=users"

attribute "chub_vault/ldap/read/host",
    :display_name => "LDAP read host",
    :description => "Host for LDAP read access; this should be a load balancer endpoint, always accessed via SSL",
    :required => "required"

attribute "chub_vault/ldap/read/cn",
    :display_name => "Read CN",
    :description => "Common name to use for LDAP read access; suffixed with the base_dn to form a DN",
    :required => "optional",
    :default => "cn=searchrole"

attribute "chub_vault/ldap/read/password",
    :display_name => "Read password",
    :description => "Password to use for LDAP read access",
    :required => "required"

attribute "chub_vault/ldap/write/host",
    :display_name => "LDAP write host",
    :description => "Host for LDAP write access; this should be a load balancer endpoint, always accessed via SSL",
    :required => "required"

attribute "chub_vault/ldap/write/cn",
    :display_name => "Write CN",
    :description => "Common name to use for LDAP write access; suffixed with the base_dn to form a DN",
    :required => "optional",
    :default => "cn=admin"

attribute "chub_vault/ldap/write/password",
    :display_name => "Write password",
    :description => "Password to use for LDAP write access",
    :required => "required"

attribute "chub_vault/ldap/healthcheck/username", :required => "optional"
attribute "chub_vault/ldap/healthcheck/valid_password", :required => "optional"
attribute "chub_vault/ldap/healthcheck/invalid_password", :required => "optional"
attribute "chub_vault/ldap/healthcheck/guid", :required => "optional"

attribute "chub_vault/database/url",
    :display_name => "Database URL",
    :description => "JDBC URL to use for database access",
    :required => "required"

attribute "chub_vault/database/user",
    :display_name => "Database user",
    :description => "User to use for database access",
    :required => "required"

attribute "chub_vault/database/password",
    :display_name => "Database password",
    :description => "Password to use for database access",
    :required => "required"

attribute "chub_vault/java_heap_size",
    :display_name => "Vault Java heap size",
    :description => "Heap size with which to run the Vault JVM",
    :required => "optional",
    :default => "1G"

attribute "chub_vault/archaius_config",
    :display_name => "Archaius configuration",
    :type => "hash",
    :required => "optional"

attribute "graphite/host", :required => "recommended"
attribute "graphite/port", :required => "optional"
