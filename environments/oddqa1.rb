name "oddqa1"
description 'For the SLM QA1 Nodes'
cookbook_versions({
  "chub_apartment"=>"= 0.1.0",
  "chub_oddrest"=>"= 0.1.0",
  "chub_rolodex"=>"= 0.1.1",
  "chub_tattler"=>"= 0.3.0"
})
default_attributes(
  :slm => {
    :odd_service => {
      :baseUrl => "http://oddqa1rest1.nexus.commercehub.com:8080",
	  :port => "8080",
	  :admin_port => "8081"
    },
    :apartment => {
      :baseUrl => "http://oddqa1apartment1.nexus.commercehub.com:8080",
	  :port => "8080",
	  :admin_port => "8081"
    },
    :rolodex => {
      :baseUrl => "http://oddqa1rolodex1.nexus.commercehub.com:8080",
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
            :name => "oddqa1_orderstream"
        }
    },
    :graphite => {
        :host => "stats02.nexus.commercehub.com",
        :port => "2003"
    },
	:hazelcast => {
		:group => "qa1-rolodex",
		:password => "password"
	}
  },
  :chub_tattler => {
    :db => {
      :server => "SQLVM03",
      :name => "tattlerqa1_tat",
      :userName => "devusr01",
      :pass => "usrdev"
    }
  },
  :chub_oddrest => {
    :app_url => "http://artifactory01.nexus.commercehub.com/artifactory/libs-release/com/commercehub/oddservice/%5BRELEASE%5D/oddservice-%5BRELEASE%5D.jar",
    :db => {
      :server => "SQLVM03",
      :name => "oddqa1_odd",
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
      :name => "oddqa1_chub",
      :userName => "devusr01",
      :pass => "usrdev"
    }
  },
  :chub_rolodex => {
    :app_url => "http://artifactory01.nexus.commercehub.com/artifactory/libs-release/com/commercehub/rolodex/%5BRELEASE%5D/rolodex-%5BRELEASE%5D.jar",
    :yui => {
      :filter => "min",
      :combine => true,
      :url => "http://yuicombo1.nexus.commercehub.com:3000"
    }
  }
)
