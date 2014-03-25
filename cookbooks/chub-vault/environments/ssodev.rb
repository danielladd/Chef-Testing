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
	"ldap_write_host" => "ssodev1-ldap-write.nexus.commercehub.com",
    "database" => {
      "url" => "jdbc:sqlserver://sqlvm81.nexus.commercehub.com;databaseName=ssodev-vault",
      "user" => "devusr01",
      "password" => "usrdev"
    },
    "search_password" => "search",
	"write_password" => "rootpw"
  }
)
