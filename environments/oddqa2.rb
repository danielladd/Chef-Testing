name "oddqa2"
description 'For the ODD QA2 Nodes'
cookbook_versions({
  "chub_tattler"=>"= 0.3.0"
})
default_attributes(
  :slm => {
    :odd_service => {
      :baseUrl => "http://oddqa2-rest.nexus.commercehub.com/"
    }
  },
  :chub_tattler => {
    :db => {
      :server => "SQLVM03",
      :name => "tattlerqa2_tat",
      :userName => "devusr01",
      :pass => "usrdev"
    }
  }
)
