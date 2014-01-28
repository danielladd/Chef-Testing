name "ssoqa1"
description "SSO QA environment 1"
default_attributes(
    "chub-castle" => {
      "vault_url" => "https://ssoqa1-vault.nexus.commercehub.com:8443",
      "truststore_file" => "dev-truststore.jks",
      "keystore_file" => "dev-keystore.jks"
    }
)
