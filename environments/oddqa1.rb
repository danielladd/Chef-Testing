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
      :baseUrl => "http://oddqa1-rest.nexus.commercehub.com/"
    },
    :apartment => {
      :baseUrl => "http://oddqa1-apartment.nexus.commercehub.com/"
    },
    :rolodex => {
      :baseUrl => "http://oddqa1-rolodex.nexus.commercehub.com/"
    },
    :sso => {
      :vault => "https://ssoqa1-vault.nexus.commercehub.com:8080/",
      :census => "https://ssoqa1-census.nexus.commercehub.com:8080/",
      :castle => "https://ssoqa1-castle.nexus.commercehub.com/",
      :plaza => "https://ssoqa1-plaza.nexus.commercehub.com/"
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
    :app_url => "http://artifactory01.nexus.commercehub.com/artifactory/libs-release/com/commercehub/oddservice/%5BRELEASE%5D/oddservice-%5BRELEASE%5D.jar;env.oddqa1.current+=true",
    :db => {
      :server => "SQLVM03",
      :name => "oddqa1_odd",
      :userName => "devusr01",
      :pass => "usrdev"
    }
  },
  :chub_apartment => {
    :db => {
      :server => "SQLVM03",
      :name => "oddqa1_chub",
      :userName => "devusr01",
      :pass => "usrdev"
    }
  },
  :chub_rolodex => {
    :yui => {
      :filter => "min",
      :combine => true,
      :url => "http://yuicombo1.nexus.commercehub.com:3000/"
    }
  }
)
