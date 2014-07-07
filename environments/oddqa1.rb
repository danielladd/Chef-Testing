name "oddqa1"
description 'For the ODD QA1 Nodes'
cookbook_versions({
  "chub_tattler"=>"= 0.3.0"
})
default_attributes(
  :slm => {
    :odd_service => {
      :baseUrl => "http://oddqa1-rest.nexus.commercehub.com/"
    }
  },
  :chub_tattler => {
    :db => {
      :server => "SQLVM03",
      :name => "tattlerqa1_tat",
      :userName => "devusr01",
      :pass => "usrdev"
    }
  }
)
