name "dev"
default_attributes(
  :sensu => {
    :rabbitmq => {
      :host => "192.168.24.132"
    }
  },
  :graphite => {
    :host => "stats02.nexus.commercehub.com"
  },
  :chub_plaza => {
    :cas_server_url => "https://ssodev1-castle.nexus.commercehub.com",
    :cas_service_url => "http://plaza.vagrant.dev:8080/shiro-cas",
    :cas_failure_url => "http://plaza.vagrant.dev:8080/auth/fail",
    :census_url => "https://ssodev1-census.nexus.commercehub.com:8443"
  }
)
