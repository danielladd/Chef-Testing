name "tatqa1"
description 'For the Tattler QA1 Nodes'
cookbook "chub_tattler", "= 0.3.0"
default_attributes(
  :chub_tattler => {
    :db => {
      :server => "SQLVM03",
      :name => "tattlerqa1_tat",
      :userName => "devusr01",
      :pass => "usrdev"
    },
    :odd => {
      :baseUrl => "http://oddqa1-rest.nexus.commercehub.com/"
    }
  }
)
