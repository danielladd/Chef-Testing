name "tatqa2"
description 'For the Tattler QA2 Nodes'
cookbook "chub_tattler", "= 0.3.0"
default_attributes(
  :chub_tattler => {
    :db => {
      :server => "SQLVM03",
      :name => "tattlerqa2_tat",
      :userName => "devusr01",
      :pass => "usrdev"
    },
    :odd => {
      :baseUrl => "http://oddqa2-rest.nexus.commercehub.com/"
    }
  }
)
