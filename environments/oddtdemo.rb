name "oddtdemo"
description 'For the SLM TDemo Nodes'
default_attributes(
  :slm => {
    :odd_service => {
      :baseUrl => "http://demo-odd.nexus.commercehub.com",
	  :port => "8080",
	  :admin_port => "8081"
    },
    :apartment => {
      :baseUrl => "http://tdemo-apartment.nexus.commercehub.com:8080",
	  :port => "8080",
	  :admin_port => "8081"
    },
    :rolodex => {
      :baseUrl => "https://tdemo-rolodex.nexus.commercehub.com",
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
            :name => "orderstream_demo_test"
        }
    },
    :graphite => {
        :host => "stats02.nexus.commercehub.com",
        :port => "2003"
    }
  },
  :chub_tattler => {
    :db => {
      :server => "sqlisdemo",
      :name => "tattlerdev1_tat",
      :userName => "isdemo",
      :pass => "isrocksondemo"
    }
  },
  :chub_oddrest => {
    :app_url => "http://artifactory01.nexus.commercehub.com/artifactory/libs-release/com/commercehub/oddservice/%5BRELEASE%5D/oddservice-%5BRELEASE%5D.jar",
    :db => {
      :server => "sqlietest01",
      :name => "HubODS",
      :userName => "iedemo",
      :pass => "isrocksondemo"
    },
    :app_url => "http://artifactory01.nexus.commercehub.com/artifactory/libs-release/com/commercehub/oddservice/%5BRELEASE%5D/oddservice-%5BRELEASE%5D.jar"
  },
  :chub_apartment => {
    :app_url => "http://artifactory01.nexus.commercehub.com/artifactory/libs-release/com/commercehub/apartment/%5BRELEASE%5D/apartment-%5BRELEASE%5D.jar",
    :db => {
      :server => "sqlietest01",
      :port => "1433",
      :name => "tdemoorderstream",
      :userName => "iedemo",
      :pass => "isrocksondemo"
    }
  },
  :chub_rolodex => {
    :app_url => "http://artifactory01.nexus.commercehub.com/artifactory/libs-release/com/commercehub/rolodex/%5BRELEASE%5D/rolodex-%5BRELEASE%5D.jar",
    :yui => {
      :filter => "min",
      :combine => true,
      :url => "//odd-yui-combo.nexus.commercehub.com"
    },
	:hazelcast => {
      :password => "slmdemo-pass",
      :multicast_group => "224.2.3.8",
      :multicast_port => 54429
    }
  }
)
