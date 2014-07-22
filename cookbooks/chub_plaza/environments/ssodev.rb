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
    :app_context => "/secure/portal",
    :app_root_url => "http://plaza.vagrant.dev:8080/secure/portal",
    :cas_server_url => "https://ssodev1-castle.nexus.commercehub.com",
    :cas_service_url => "http://plaza.vagrant.dev:8080/secure/portal/shiro-cas",
    :cas_failure_url => "http://plaza.vagrant.dev:8080/secure/portal",
    :greenmail => {
      :disabled => false
    },
#    :mail => {
#      :disabled => true,
#      :host => "badhost",
#      :port => 1234,
#      :username => "myuser",
#      :password => "mypass",
#      :override_address => "bad@localhost"
#    },
    :census_url => "https://ssodev1-census.nexus.commercehub.com:8443",
    :vault_url => "https://ssodev1-vault.nexus.commercehub.com:8443",
    :hazelcast => {
      :group => "ssodev",
      :password => "password"
    }
  }
)
