name "ssodev"
default_attributes(
  "java" => {
    "oracle" => {
      "accept_oracle_download_terms" => true
    },
    "install_flavor" => "oracle",
    "jdk_version" => "8",
    "jdk" => {
      "8" => {
        "x86_64" => {
          "url" => "http://artifactory01.nexus.commercehub.com/artifactory/java-distributions/jdk/8-b132/jdk-8-linux-x64.tar.gz"
        }
      }
    }
  },
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
