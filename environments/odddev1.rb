name "odddev1"
description 'For the ODD Dev1 Nodes'
cookbook_versions({
  "chub_tattler"=>"= 0.3.0"
})
default_attributes(
  :slm => {
    :odd_service => {
      :baseUrl => "http://odddev1-rest.nexus.commercehub.com/"
    }
  },
  :chub_tattler => {
    :db => {
      :server => "SQLVM03",
      :name => "tattlerdev1_tat",
      :userName => "devusr01",
      :pass => "usrdev"
    }
  }
)
