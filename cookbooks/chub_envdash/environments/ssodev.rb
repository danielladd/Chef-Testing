name "ssodev"
default_attributes(
  :chub_envdash => {
#    :app => {
#      :url => "file:///vagrant/envdash.jar"
#    },
    :title => "SSO Environments",
    :prefix => "sso",
    :environment_names => ["ssodev1", "ssoqa1", "ssoprod1"]
  }
)
