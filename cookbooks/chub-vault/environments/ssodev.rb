name "ssodev"
default_attributes(
  "sensu" => {
    "rabbitmq" => {
      "host" => "192.168.24.132"
    }
  },
  "graphite" => {
    "host" => "stats02.nexus.commercehub.com"
  },
  "chub-vault" => {
    "ldap_read_host" => "ssodev1-ldap-read.nexus.commercehub.com",
    "search_password" => "search"
  }
)
