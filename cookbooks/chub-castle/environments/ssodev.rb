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
  "chub-castle" => {
    "vault.url" => "https://ssodev1-vault.nexus.commercehub.com:8443",
    "database" => {
        "server"=> "sqlvm81.nexus.commercehub.com",
        "name"=> "ssodev-castle",
        "user"=> "devusr01",
        "pass"=> "usrdev",
    }
  }
)
