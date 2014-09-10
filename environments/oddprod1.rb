name "oddprod1"
description 'For the SLM PROD1 Nodes'
default_attributes(
  :slm => {
    :odd_service => {
      :baseUrl => "http://odddev1-rest.nexus.commercehub.com",
	  :port => "8080",
	  :admin_port => "8081"
    },
    :apartment => {
      :baseUrl => "http://odddev1-apartment.nexus.commercehub.com:8080",
	  :port => "8080",
	  :admin_port => "8081"
    },
    :rolodex => {
      :baseUrl => "http://odddev1-rolodex.nexus.commercehub.com",
	  :port => "8080",
	  :admin_port => "8081"
    },
    :sso => {
      :vault => "https://ssoint1-vault.nexus.commercehub.com:8443",
      :census => "https://ssoint1-census.nexus.commercehub.com:8443",
      :castle => "https://ssoint1-apps.nexus.commercehub.com/account",
      :plaza => "https://ssoint1-apps.nexus.commercehub.com/user"
    },
    :ordersteam => {
        :app => {
            :id => "DSM",
            :name => "odddev1_orderstream"
        }
    },
    :graphite => {
        :host => "stats02.nexus.commercehub.com",
        :port => "2003"
    }
  },
  :chub_tattler => {
    :db => {
      :server => "SQLVM03",
      :name => "tattlerdev1_tat",
      :userName => "devusr01",
      :pass => "usrdev"
    }
  },
  :chub_oddrest => {
    :app_url => "http://artifactory01.nexus.commercehub.com/artifactory/libs-release/com/commercehub/oddservice/%5BRELEASE%5D/oddservice-%5BRELEASE%5D.jar;env.oddprod1.current+=true",
    :db => {
      :server => "SQLVM03",
      :name => "odddev1_odd",
      :userName => "devusr01",
      :pass => "usrdev"
    }
  },
  :chub_apartment => {
    :app_url => "http://artifactory01.nexus.commercehub.com/artifactory/libs-release/com/commercehub/apartment/%5BRELEASE%5D/apartment-%5BRELEASE%5D.jar;env.oddprod1.current+=true",
    :db => {
      :server => "SQLVM03",
      :port => "1433",
      :name => "odddev1_chub",
      :userName => "devusr01",
      :pass => "usrdev"
    }
  },
  :chub_rolodex => {
    :app_url => "http://artifactory01.nexus.commercehub.com/artifactory/libs-release/com/commercehub/rolodex/%5BRELEASE%5D/rolodex-%5BRELEASE%5D.jar;env.oddprod1.current+=true",
    :yui => {
      :filter => "min",
      :combine => true,
      :url => "http://yuicombo1.nexus.commercehub.com:3000"
    },
	:hazelcast => {
      :password => "slmprod-pass",
      :multicast_group => "224.2.3.6",
      :multicast_port => 54430
    },
	:activedirectory => {
	  :server_url => "ldaps://ldap.commercehub.com:636",
	  :domain => "commercehub.com",
	  :requiredGroups => "[\"role_rolodex_all_prod\"]"
	}
  }
)
