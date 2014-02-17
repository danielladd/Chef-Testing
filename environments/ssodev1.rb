name "ssodev1"
description "SSO development environment 1"
default_attributes(
  "sensu" => {
    "rabbitmq" => {
      "host" => "ssodev1sensu.nexus.commercehub.com"
    }
  },
  "graphite" => {
    "host" => "stats02.nexus.commercehub.com"
  },
  "chub-sensu" => {
    "email" => {
      "recipient" => "sso-team@commercehub.com"
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
    "ldap_read_host" => "ssodev1-ldap-read.nexus.commercehub.com",
    "search_password" => "search"
  },
  "chub-census" => {
    "app_url" => "file:///var/census/staged-census.jar",
    "database" => {
      "url" => "jdbc:sqlserver://sqlvm81.nexus.commercehub.com;databaseName=ssodev1-census",
      "user" => "devusr01",
      "password" => "usrdev"
    }
  },
  "chub-castle" => {
    "app_url" => "file:///var/castle/staged-castle.war",
    "vault_url" => "https://ssodev1-vault.nexus.commercehub.com:8443",
    "truststore_file" => "dev-truststore.jks",
    "keystore_file" => "dev-keystore.jks",
    "db_server"=> "sqlvm81.nexus.commercehub.com",
    "db_name"=> "ssodev1-castle",
    "db_user"=> "devusr01",
    "db_pass"=> "usrdev"
  },
  "chub-plaza" => {
    "app_url" => "file:///var/plaza/staged-plaza.jar",
    "cas_server_url" => "https://ssodev1-castle.nexus.commercehub.com",
    "cas_service_url" => "https://ssodev1-plaza.nexus.commercehub.com/shiro-cas",
    "census_url" => "https://ssodev1-census.nexus.commercehub.com:8443"
  }
)
