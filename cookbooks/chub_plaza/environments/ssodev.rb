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
    :app_url => "file:///vagrant/plaza.jar",
    :app_context => "/user",
    :app_root_url => "http://plaza.vagrant.dev:8080/user",
    :cas_server_url => "https://ssodev1-apps.nexus.commercehub.com/account",
    :cas_service_url => "http://plaza.vagrant.dev:8080/user/shiro-cas",
    :cas_failure_url => "http://plaza.vagrant.dev:8080/user",
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
    },
    :applicationURLs => {
      :buyspace => "https://mpqa2-buyspace.commercehub.com",
      :productstream => "https://mpqa2-buyspace.commercehub.com/auth/login?targetUri=/?profile=productstream",
      :orderstream => "https://test.commercehub.com"
    }
  }
)
