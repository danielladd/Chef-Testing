name "dev"
default_attributes(
  "sensu" => {
    "rabbitmq" => {
      "host" => "192.168.24.132"
    }
  },
  "chub-castle" => {
    "vault_url" => "https://ssodev1-vault.nexus.commercehub.com:8443",
    "db_server"=> "sqlvm81.nexus.commercehub.com",
    "db_name"=> "ssodev-castle",
    "db_user"=> "devusr01",
    "db_pass"=> "usrdev",
    "graphite_url" => "stats02.nexus.commercehub.com"
  }
)
