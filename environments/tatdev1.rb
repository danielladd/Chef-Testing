name "tatdev1"
description 'For the Tattler Dev1 Nodes'
cookbook "chub_tattler", "= 0.3.0"
default_attributes(
  :chub_tattler => {
    :db => {
      :server => "SQLVM03",
      :name => "tattlerdev1_tat",
      :userName => "devusr01",
      :pass => "usrdev"
    },
    :odd => {
      :baseUrl => "http://odddev1-rest.nexus.commercehub.com/"
    }
  }
)
