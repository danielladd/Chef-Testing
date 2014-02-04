name "ssoqa1"
description "SSO QA environment 1"
cookbook_versions({
  "chub-openldap" => "= 1.12.12",
  "chub-vault" => "= 0.1.1",
  "chub-castle" => "= 0.1.9",
  "chub-plaza" => "= 0.1.0",
})
# TODO: switch to this when we next update vault
# "ldap_read_host" => "ssoqa1-ldap-read.nexus.commercehub.com",
default_attributes(
  "sensu" => {
    "rabbitmq" => {
      "host" => "ssodev1sensu.nexus.commercehub.com"
    }
  },
  "openldap" => {
    "rootpw" => "{SSHA}5KCtUCN05db79SevGkBTeb4F76SnRiJy",
    "tls_enabled" => true,
    "slapd_replpw" => "replpw",
    "manage_ssl" => true,
    "basedn" => "dc=vault,dc=commercehub,dc=com"
  },
  "chub-vault" => {
    "app_url" => "file:///var/vault/staged-vault.jar",
    "ldap_read_host" => "ssoqa1ldap1.nexus.commercehub.com",
    "search_password" => "search"
  },
  "chub-castle" => {
    "app_url" => "file:///var/castle/staged-castle.war",
    "vault_url" => "https://ssoqa1-vault.nexus.commercehub.com:8443",
    "truststore_file" => "dev-truststore.jks",
    "keystore_file" => "dev-keystore.jks",
    "db_server"=> "sqlvm81.nexus.commercehub.com",
    "db_name"=> "ssoqa1-castle",
    "db_user"=> "devusr01",
    "db_pass"=> "usrdev"
  },
  "chub-plaza" => {
    "app_url" => "file:///var/plaza/staged-plaza.jar",
    "cas_server_url" => "https://ssoqa1-castle.nexus.commercehub.com",
    "cas_service_url" => "https://ssoqa1-plaza.nexus.commercehub.com/shiro-cas",
    "graphite_host" => "stat02.nexus.commercehub.com"
  }
)
