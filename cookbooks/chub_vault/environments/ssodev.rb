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
  :chub_vault => {
    :ldap => {
      :read => {
        :host => "ssodev1-ldap-read.nexus.commercehub.com",
        :password => "readpw"
      },
      :write => {
        :host => "ssodev1-ldap-write.nexus.commercehub.com",
        :password => "writepw"
      }
    },
    :database => {
      :url => "jdbc:sqlserver://sqlvm81.nexus.commercehub.com;databaseName=ssodev-vault",
      :user => "devusr01",
      :password => "usrdev"
    }
  }
)
