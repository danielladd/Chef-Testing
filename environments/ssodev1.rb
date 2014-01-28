name "ssodev1"
description "SSO development environment 1"
default_attributes(
    "chub-vault" => {
      "app_url" => "file:///var/vault/staged-vault.jar",
      "ldap_read_host" => "ssodev1-ldap-read.nexus.commercehub.com",
      "search_password" => "search"
    },
    "chub-castle" => {
      "app_url" => "file:///var/castle/staged-castle.war",
      "vault_url" => "https://ssodev1-vault.nexus.commercehub.com:8443",
      "truststore_file" => "dev-truststore.jks",
      "keystore_file" => "dev-keystore.jks"
    }
)
