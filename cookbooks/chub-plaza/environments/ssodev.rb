name "dev"
default_attributes(
    "sensu" => {
      "rabbitmq" => {
        "host" => "192.168.24.132"
      }
    },
    "graphite" => {
      "host" => "stats02.nexus.commercehub.com"
    },
    "chub-plaza" => {
      "cas_server_url" => "https://ssodev1-castle.nexus.commercehub.com",
      "cas_service_url" => "http://plaza.vagrant.dev:8080/shiro-cas",
      "census_url" => "https://ssodev1-census.nexus.commercehub.com:8443"
    }
)
