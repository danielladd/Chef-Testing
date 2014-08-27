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
      :baseUrl => "http://demo-odd.nexus.commercehub.com"
    },
    :apartment => {
      :baseUrl => "http://demo-apartment.nexus.commercehub.com:8080"
    },
    :rolodex => {
      :baseUrl => "https://demo-rolodex.nexus.commercehub.com"
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
            :name => "demo_orderstream"
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
      :server => "sqlisdemo",
      :name => "HubODS",
      :userName => "isdemo",
      :pass => "isrocksondemo"
    },
    :app_url => "http://artifactory01.nexus.commercehub.com/artifactory/libs-release/com/commercehub/oddservice/%5BRELEASE%5D/oddservice-%5BRELEASE%5D.jar"
  },
  :chub_apartment => {
    :app_url => "http://artifactory01.nexus.commercehub.com/artifactory/libs-release/com/commercehub/apartment/%5BRELEASE%5D/apartment-%5BRELEASE%5D.jar",
    :db => {
      :server => "sqlisdemo",
      :port => "1433",
      :name => "chub",
      :userName => "isdemo",
      :pass => "isrocksondemo"
    }
  },
  :chub_rolodex => {
    :app_url => "http://artifactory01.nexus.commercehub.com/artifactory/libs-release/com/commercehub/rolodex/%5BRELEASE%5D/rolodex-%5BRELEASE%5D.jar",
    :yui => {
      :filter => "min",
      :combine => true,
      :url => "//demo-yui.nexus.commercehub.com"
    }
  }
)
