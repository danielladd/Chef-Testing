name "ssodev1"
description "SSO development environment 1"
default_attributes(
    "chub-castle" => {
      "vault_url" => "https://ssodev1-vault.nexus.commercehub.com:8443",
      "truststore_file" => "dev-truststore.jks",
      "keystore_file" => "dev-keystore.jks"
    }
)
