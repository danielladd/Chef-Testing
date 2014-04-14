name "browserstack_tunnel"
default_attributes(
  :chub_browserstack_tunnel => {
    :services => [
      {:host => "ssodev1-castle.nexus.commercehub.com", :port => 443, :ssl => true},
      {:host => "ssodev1-plaza.nexus.commercehub.com", :port => 443, :ssl => true}
    ]
  }
)
