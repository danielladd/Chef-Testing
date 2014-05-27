name "ssoutil1"
description "SSO utility environment 1"
cookbook_versions({
  "chub_envdash" => "= 0.1.2",
  "chub_java" => "= 0.1.1"
})
default_attributes(
  :sensu => {
    :api => {
      :user => "sensuapi",
      :password => "@HrMgi1I3exo"
    },
    :rabbitmq => {
      :host => "ssodev1sensu.nexus.commercehub.com"
    }
  },
  :chub_envdash => {
    :title => "SSO Environments",
    :prefix => "sso",
    :environment_names => ["ssodev1", "ssoqa1", "ssoprod1"]
  }
)
