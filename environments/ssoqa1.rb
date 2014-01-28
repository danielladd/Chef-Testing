name "ssoqa1"
description "SSO QA environment 1"
default_attributes(
    "chub-vault" => {
      "app_url" => "file:///var/vault/staged-vault.jar",
      "ldap_read_host" => "ssoqa1-ldap-read.nexus.commercehub.com",
      "search_password" => "search"
    },
    "chub-castle" => {
      "app_url" => "file:///var/castle/staged-castle.war",
      "vault_url" => "https://ssoqa1-vault.nexus.commercehub.com:8443",
      "truststore_file" => "dev-truststore.jks",
      "keystore_file" => "dev-keystore.jks"
    },
    "chub-plaza" => {
      "app_url" => "file:///var/plaza/staged-plaza.jar",
      "cas_server_url" => "https://ssoqa1castle1.nexus.commercehub.com:8443",
      "cas_service_url" => "http://ssoqa1plaza1.nexus.commercehub.com:8080/shiro-cas",
      "graphite_host" => "stat02.nexus.commercehub.com"
    }
)
