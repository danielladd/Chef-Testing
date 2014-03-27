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
