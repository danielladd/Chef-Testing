name "ssodev"
default_attributes(
  :sensu => {
    :rabbitmq => {
      :host => "192.168.24.132"
    }
  },
  :graphite => {
    :host => "stats02.nexus.commercehub.com"
  },
  :chub_census => {
    :database => {
      :url => "jdbc:sqlserver://sqlvm81.nexus.commercehub.com;databaseName=ssodev-census",
      :user => "devusr01",
      :password => "usrdev",
    },
    :plaza_url => "https://ssodev1-plaza.nexus.commercehub.com"
  }
)
