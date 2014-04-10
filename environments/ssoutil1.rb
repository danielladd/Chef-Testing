name "ssoutil1"
description "SSO utility environment 1"
cookbook_versions({
  "apt" => "= 2.3.8",
  "base" => "= 0.1.12",
  "build-essential" => "= 1.4.2",
  "chef-client" => "= 3.0.6",
  "chef-kick" => "= 0.1.0",
  "chef_handler" => "= 1.1.5",
  "chub_envdash" => "= 0.1.0",
  "cron" => "= 1.2.6",
  "dmg" => "= 2.1.4",
  "git" => "= 2.9.0",
  "java" => "= 1.22.0",
  "ntp" => "= 1.5.4",
  "python" => "= 1.3.6",
  "runit" => "= 1.5.8",
  "windows" => "= 1.30.0",
  "yum" => "= 3.1.2",
  "yum-epel" => "= 0.3.4"
})
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
    :title => "SSO Environments",
    :prefix => "sso",
    :environment_names => ["ssodev1", "ssoqa1", "ssoprod1"]
  }
)
