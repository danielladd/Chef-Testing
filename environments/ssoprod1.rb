name "ssoprod1"
description "SSO Prod environment 1"
cookbook_versions({
  "apache2" => "= 1.7.0",
  "apt" => "= 2.3.8",
  "base" => "= 0.1.19",
  "bluepill" => "= 2.3.1",
  "build-essential" => "= 1.4.2",
  "chef-client" => "= 3.0.6",
  "chef-kick" => "= 0.1.1",
  "chef_handler" => "= 1.1.5",
  "chub_castle" => "= 0.2.0",
  "chub_census" => "= 0.2.0",
  "chub_java" => "= 0.1.1",
  "chub_openldap" => "= 1.12.21",
  "chub_plaza" => "= 0.4.0",
  "chub_sensu_sso" => "= 0.1.19",
  "chub_vault" => "= 0.6.0",
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
      :host => "ssoprod1sensu.commercehub.com"
    }
  },
  :graphite => {
    :host => "stats03.commercehub.com"
  },
  :chub_sensu_sso => {
    :pagerduty => {
      :api_key => "3f602c6a12c6479abdfca394c9ce1ddc"
    },
    :loadbalancer_urls => {
      :vault => "https://ssoprod1-vault.commercehub.com:8443/ping",
      :census => "https://ssoprod1-census.commercehub.com:8443/ping",
      :castle => "https://apps.commercehub.com/account/ping",
      :plaza => "https://apps.commercehub.com/user/ping",
      :steward => "https://ssoprod1-steward.commercehub.com/ping"
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
    :app_url => "http://artifactory01.nexus.commercehub.com/artifactory/libs-release/com/commercehub/vault-server/%5BRELEASE%5D/vault-server-%5BRELEASE%5D-shadow.jar;env.ssoprod1.current+=true",
    :authentication => {
      :activedirectory => {
        :required_groups => []
      }
    },
    :ldap => {
      :read => {
        :host => "ssoprod1-ldap-read.commercehub.com",
        :password => "adminRead1234"
      },
      :write => {
        :host => "ssoprod1-ldap-write.commercehub.com",
        :password => "adminWrite1234"
      },
      :healthcheck => {
        :guid => "fd9a39e4-b36c-11e3-92cf-080027c2a6f5"
      }
    },
    :database => {
      :url => "jdbc:sqlserver://sqlsso.commercehub.com;databaseName=sso-vault",
      :user => "sso_user",
      :password => "VBqgPyf6"
    }
  },
  :chub_census => {
    :app_url => "http://artifactory01.nexus.commercehub.com/artifactory/libs-release/com/commercehub/census-server/%5BRELEASE%5D/census-server-%5BRELEASE%5D-shadow.jar;env.ssoprod1.current+=true",
    :authentication => {
      :activedirectory => {
        :required_groups => []
      }
    },
    :plaza_url => "https://apps.commercehub.com/user",
    :vault_url => "https://ssoprod1-vault.commercehub.com:8443",
    :profileUpdateNotificationUrls => ["https://ssoprod1-vault.nexus.commercehub.com:8443/person/receiveUpdate"],
    :database => {
      :url => "jdbc:sqlserver://sqlsso.commercehub.com;databaseName=sso-census",
      :user => "sso_user",
      :password => "VBqgPyf6"
    }
  },
  :chub_castle => {
    :app_url => "http://artifactory01.nexus.commercehub.com/artifactory/libs-release/com/commercehub/castle/%5BRELEASE%5D/castle-%5BRELEASE%5D.war;env.ssoprod1.current+=true",
    :app_context => "/account",
    :domain => "apps.commercehub.com",
    :default_service_url => "https://apps.commercehub.com/user/shiro-cas",
    :forgot_password_url => "https://apps.commercehub.com/user/forgot-password",
    :census_url => "https://ssoprod1-census.commercehub.com:8443",
    :vault_url => "https://ssoprod1-vault.commercehub.com:8443",
    :truststore_file => "dev-truststore.jks",
    :keystore_file => "dev-keystore.jks",
    :hazelcast => {
      :password => "ssoprod-pass",
      :multicast_group => "224.2.2.6",
      :multicast_port => 54330,
      :service_ticket_timeout => 1800,
      :ticket_granting_ticket_timeout => 7200
    }
  },
  :chub_plaza => {
    :app_url => "http://artifactory01.nexus.commercehub.com/artifactory/libs-release/com/commercehub/plaza/%5BRELEASE%5D/plaza-%5BRELEASE%5D.jar;env.ssoprod1.current+=true",
    :app_context => "/user",
    :app_root_url => "https://apps.commercehub.com/user",
    :cas_server_url => "https://apps.commercehub.com/account",
    :cas_service_url => "https://apps.commercehub.com/user/shiro-cas",
    :cas_failure_url => "https://apps.commercehub.com/user",
    :census_url => "https://ssoprod1-census.commercehub.com:8443",
    :vault_url => "https://ssoprod1-vault.commercehub.com:8443",
    :hazelcast => {
      :password => "ssoprod-pass",
      :multicast_group => "224.2.2.6",
      :multicast_port => 54330
    },
    :mail => {
        :host => "prodmail.commercehub.com"
    },
    :applicationURLs => {
      :buyspace => "https://www.buyspace.com",
      :productstream => "http://productstream.commercehub.com",
      :orderstream => "https://dsm.commercehub.com/dsm"
    }
  }
)
