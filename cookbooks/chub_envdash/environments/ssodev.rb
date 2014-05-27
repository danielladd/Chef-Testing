name "ssodev"
default_attributes(
  :sensu => {
    :api => {
      :user => "sauser",
      :password => "sapassword"
    }
  },
  :chub_envdash => {
#    :app => {
#      :url => "file:///vagrant/envdash.jar"
#    },
    :title => "SSO Environments",
    :prefix => "sso",
    :environment_names => ["ssodev1", "ssoqa1", "ssoprod1"],
    :role_names => ["castle", "census", "ldap", "monitor", "plaza", "vault"]
  }
)
