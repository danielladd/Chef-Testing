name "ssoqa1"
description "SSO QA environment 1"
cookbook_versions({
  "chub-vault" => "= 0.1.1",
  "chub-castle" => "= 0.1.9",
  "chub-plaza" => "= 0.1.0",
})
# TODO: switch to this when we next update vault
# "ldap_read_host" => "ssoqa1-ldap-read.nexus.commercehub.com",
default_attributes(
  "chub-vault" => {
    "app_url" => "file:///var/vault/staged-vault.jar",
    "ldap_read_host" => "ssoqa1ldap1.nexus.commercehub.com",
    "search_password" => "search"
  },
  "chub-castle" => {
    "app_url" => "file:///var/castle/staged-castle.war",
    "vault_url" => "https://ssoqa1-vault.nexus.commercehub.com:8443",
    "truststore_file" => "dev-truststore.jks",
    "keystore_file" => "dev-keystore.jks"
  },
  "chub-plaza" => {
    "app_url" => "file:///var/plaza/staged-plaza.war",
    "cas_server_url" => "https://ssoqa1castle1.nexus.commercehub.com:8443",
    "cas_service_url" => "http://ssoqa1plaza1.nexus.commercehub.com:8080/shiro-cas",
    "graphite_host" => "stat02.nexus.commercehub.com"
  }
)
