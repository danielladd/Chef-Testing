name "browserstack_tunnel"
default_attributes(
  :chub_browserstack_tunnel => {
    :services => [
      {:host => "ssodev1-apps.nexus.commercehub.com", :port => 443, :ssl => true}
    ]
  }
)
