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
    "hazelcast" => {
        "group"=> "ssodev-castle",
        "password"=> "ssodev-pass",
        "network-port" => "5071",
        "multicast-group"=> "224.2.2.5",
        "multicast-port" => "54327",
        "backup-count" => "2",
        "stTimeout" => "600",
        "tgtTimeout" => "1800"
    }
  }
)
