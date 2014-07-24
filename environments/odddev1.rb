name "odddev1"
description 'For the SLM Dev1 Nodes'
cookbook_versions({
  "chub_apartment"=>"= 0.1.0",
  "chub_oddrest"=>"= 0.1.0",
  "chub_rolodex"=>"= 0.1.1",
  "chub_tattler"=>"= 0.3.0"
})
default_attributes(
  :slm => {
    :odd_service => {
      :baseUrl => "http://odddev1-rest.nexus.commercehub.com"
    },
    :apartment => {
      :baseUrl => "http://odddev1-apartment.nexus.commercehub.com:8080"
    },
    :rolodex => {
      :baseUrl => "http://odddev1-rolodex.nexus.commercehub.com"
    },
    :sso => {
      :vault => "https://ssoqa1-vault.nexus.commercehub.com:8443",
      :census => "https://ssoqa1-census.nexus.commercehub.com:8443",
      :castle => "https://ssoqa1-apps.nexus.commercehub.com/castle",
      :plaza => "https://ssoqa1-apps.nexus.commercehub.com/plaza"
    },
    :ordersteam => {
        :app => {
            :id => "DSM",
            :name => "odddev1_orderstream"
        }
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
    }
  },
  :chub_apartment => {
    :app_url => "http://artifactory01.nexus.commercehub.com/artifactory/libs-release/com/commercehub/apartment/%5BRELEASE%5D/apartment-%5BRELEASE%5D.jar",
    :db => {
      :server => "SQLVM03",
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
      :url => "http://yuicombo1.nexus.commercehub.com:3000"
    }
  }
)
