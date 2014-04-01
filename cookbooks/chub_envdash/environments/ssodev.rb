name "ssodev"
default_attributes(
  :java => {
    :oracle => {
      :accept_oracle_download_terms => true
    },
    :install_flavor => "oracle",
    :jdk_version => "8",
    :jdk => {
      "8" => {
        :x86_64 => {
          :url => "http://artifactory01.nexus.commercehub.com/artifactory/java-distributions/jdk/8-b132/jdk-8-linux-x64.tar.gz"
        }
      }
    }
  },
  :chub_envdash => {
#    :app => {
#      :url => "file:///vagrant/envdash.jar"
#    },
    :title => "SSO Environments",
    :prefix => "sso",
    :environment_names => ["ssodev1", "ssoqa1", "ssoprod1"]
  }
)
