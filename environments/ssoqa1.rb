name "ssoqa1"
description "SSO QA environment 1"
cookbook_versions({
  "apache2" => "= 1.7.0",
  "apt" => "= 2.3.8",
  "base" => "= 0.1.19",
  "bluepill" => "= 2.3.1",
  "build-essential" => "= 1.4.2",
  "chef-client" => "= 3.0.6",
  "chef-kick" => "= 0.1.1",
  "chef_handler" => "= 1.1.5",
  "chub_castle" => "= 0.1.27",
  "chub_census" => "= 0.1.9",
  "chub_java" => "= 0.1.1",
  "chub_openldap" => "= 1.12.16",
  "chub_plaza" => "= 0.2.4",
  "chub_sensu_sso" => "= 0.1.17",
  "chub_vault" => "= 0.3.5",
  "cron" => "= 1.2.6",
  "dmg" => "= 2.1.4",
  "erlang" => "= 1.5.0",
  "git" => "= 2.9.0",
  "graphite" => "= 0.1.4",
  "hostsfile" => "= 2.4.4",
  "iptables" => "= 0.12.0",
  "logrotate" => "= 1.3.0",
  "metachef" => "= 3.0.4",
  "nodejs" => "= 1.3.0",
  "nscd" => "= 0.11.0",
  "ntp" => "= 1.5.4",
  "openssh" => "= 1.3.2",
  "openssl" => "= 1.1.0",
  "partial_search" => "= 1.0.8",
  "python" => "= 1.3.6",
  "rabbitmq" => "= 2.4.0",
  "redisio" => "= 1.7.1",
  "rsyslog" => "= 1.11.0",
  "runit" => "= 1.5.8",
  "sensu" => "= 0.8.0",
  "statsd" => "= 3.0.4",
  "sudo" => "= 2.2.2",
  "ulimit" => "= 0.3.2"
})
default_attributes(
  :sensu => {
    :api => {
      :user => "sensuapi",
      :password => "@HrMgi1I3exo"
    },
    :rabbitmq => {
      :host => "ssoqa1sensu.nexus.commercehub.com"
    }
  },
  :graphite => {
    :host => "stats02.nexus.commercehub.com"
  },
  :chub_sensu_sso => {
    :pagerduty => {
      :api_key => "3f602c6a12c6479abdfca394c9ce1ddc"
    },
    :loadbalancer_urls => {
      :vault => "https://ssoqa1-vault.nexus.commercehub.com:8443/ping",
      :census => "https://ssoqa1-census.nexus.commercehub.com:8443/ping",
      :castle => "https://ssoqa1-apps.nexus.commercehub.com/castle/ping",
      :plaza => "https://ssoqa1-apps.nexus.commercehub.com/plaza/ping"
    }
  },
  :openldap => {
    :rootpw => "{SSHA}5KCtUCN05db79SevGkBTeb4F76SnRiJy",
    :tls_enabled => true,
    :slapd_replpw => "replpw",
    :manage_ssl => true,
    :basedn => "dc=vault,dc=commercehub,dc=com"
  },
  :chub_vault => {
    :app_url => "http://artifactory01.nexus.commercehub.com/artifactory/libs-release/com/commercehub/vault-server/%5BRELEASE%5D/vault-server-%5BRELEASE%5D-shadow.jar;env.ssoqa1.current+=true",
    :ldap => {
      :read => {
        :host => "ssoqa1-ldap-read.nexus.commercehub.com",
        :password => "search"
      },
      :write => {
        :host => "ssoqa1-ldap-write.nexus.commercehub.com",
        :password => "rootpw"
      }
    },
    :database => {
      :url => "jdbc:sqlserver://sqlvm81.nexus.commercehub.com;databaseName=ssoqa1-vault",
      :user => "devusr01",
      :password => "usrdev"
    }
  },
  :chub_census => {
    :app_url => "http://artifactory01.nexus.commercehub.com/artifactory/libs-release/com/commercehub/census-server/%5BRELEASE%5D/census-server-%5BRELEASE%5D-shadow.jar;env.ssoqa1.current+=true",
    :plaza_url => "https://ssoqa1-plaza.nexus.commercehub.com",
    :vault_url => "https://ssoqa1-vault.nexus.commercehub.com:8443",
    :database => {
      :url => "jdbc:sqlserver://sqlvm81.nexus.commercehub.com;databaseName=ssoqa1-census",
      :user => "devusr01",
      :password => "usrdev"
    }
  },
  :chub_castle => {
    :app_url => "http://artifactory01.nexus.commercehub.com/artifactory/libs-release/com/commercehub/castle/%5BRELEASE%5D/castle-%5BRELEASE%5D.war;env.ssoqa1.current+=true",
    :app_context => "/castle",
    :domain => "ssoqa1-apps.nexus.commercehub.com",
    :default_service_url => "https://ssoqa1-apps.nexus.commercehub.com/plaza/shiro-cas",
    :forgot_password_url => "https://ssoqa1-apps.nexus.commercehub.com/plaza/forgotPassword",
    :census_url => "https://ssoqa1-census.nexus.commercehub.com:8443",
    :vault_url => "https://ssoqa1-vault.nexus.commercehub.com:8443",
    :truststore_file => "dev-truststore.jks",
    :keystore_file => "dev-keystore.jks",
    :hazelcast => {
      :password => "ssoqa-pass",
      :multicast_group => "224.2.2.5",
      :multicast_port => 54329,
      :service_ticket_timeout => 1800,
      :ticket_granting_ticket_timeout => 7200
    }
  },
  :chub_plaza => {
    :app_url => "http://artifactory01.nexus.commercehub.com/artifactory/libs-release/com/commercehub/plaza/%5BRELEASE%5D/plaza-%5BRELEASE%5D.jar;env.ssoqa1.current+=true",
    :app_context => "/plaza",
    :app_root_url => "https://ssoqa1-apps.nexus.commercehub.com/plaza",
    :cas_server_url => "https://ssoqa1-apps.nexus.commercehub.com/castle",
    :cas_service_url => "https://ssoqa1-apps.nexus.commercehub.com/plaza/shiro-cas",
    :cas_failure_url => "https://ssoqa1-apps.nexus.commercehub.com/plaza",
    :census_url => "https://ssoqa1-census.nexus.commercehub.com:8443",
    :vault_url => "https://ssoqa1-vault.nexus.commercehub.com:8443",
    :hazelcast => {
      :password => "ssoqa-pass",
      :multicast_group => "224.2.2.5",
      :multicast_port => 54329
    },
    :email => {
      :strategy => "log"
    }
  }
)
