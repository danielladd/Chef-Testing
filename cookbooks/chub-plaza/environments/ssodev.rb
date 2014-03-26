name "dev"
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
  "chub-plaza" => {
    "cas_server_url" => "https://ssodev1-castle.nexus.commercehub.com",
    "cas_service_url" => "http://plaza.vagrant.dev:8080/shiro-cas",
    "cas_failure_url" => "http://plaza.vagrant.dev:8080/",
    "census_url" => "https://ssodev1-census.nexus.commercehub.com:8443"
  }
)
