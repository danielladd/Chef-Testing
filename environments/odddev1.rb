name "odddev1"
description 'For the SLM Dev1 Nodes'
cookbook_versions({
  "chub_apartment"=>"= 0.1.0",
  "chub_oddrest"=>"= 0.1.0",
  "chub_rolodex"=>"= 0.1.1",
  "chub_tattler"=>"= 0.3.0",
  "chub_log"=>"= 0.1.5",
  "chub_nxlog"=>"= 0.1.14",
  "chub_sensu"=>"= 0.1.20"
})
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
      :baseUrl => "https://odddev1-rolodex.nexus.commercehub.com",
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
    :app_url => "http://artifactory01.nexus.commercehub.com/artifactory/libs-release/com/commercehub/oddservice/%5BRELEASE%5D/oddservice-%5BRELEASE%5D.jar",
    :db => {
      :server => "SQLVM03",
      :name => "odddev1_odd",
      :userName => "devusr01",
      :pass => "usrdev"
    },
    :app_url => "http://artifactory01.nexus.commercehub.com/artifactory/libs-release/com/commercehub/oddservice/%5BRELEASE%5D/oddservice-%5BRELEASE%5D.jar"
  },
  :chub_apartment => {
    :app_url => "http://artifactory01.nexus.commercehub.com/artifactory/libs-release/com/commercehub/apartment/%5BRELEASE%5D/apartment-%5BRELEASE%5D.jar",
    :db => {
      :server => "SQLVM03",
      :port => "1433",
      :name => "odddev1_chub",
      :userName => "devusr01",
      :pass => "usrdev"
    }
  },
  :chub_rolodex => {
    :app_url => "http://artifactory01.nexus.commercehub.com/artifactory/libs-release/com/commercehub/rolodex/%5BRELEASE%5D/rolodex-%5BRELEASE%5D.jar",
    :yui => {
      :filter => "min",
      :combine => true,
      :url => "https://odd-yui-combo.nexus.commercehub.com"
    },
	:hazelcast => {
      :password => "slmdev-pass",
      :multicast_group => "224.2.3.4",
      :multicast_port => 54428
    }
  }
)
