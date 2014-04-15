name "esdev1"
description "ElasticSearch Dev 1 Cluster"
cookbook_versions({
  "apache2" => "= 1.7.0",
  "apt" => "= 2.3.8",
  "ark" => "= 0.7.2",
  "aws" => "= 1.0.0",
  "base" => "= 0.1.6",
  "bluepill" => "= 2.3.1",
  "build-essential" => "= 1.4.2",
  "chef-client" => "= 3.0.6",
  "chef-kick" => "= 0.1.0",
  "chef_handler" => "= 1.1.5",
  "chub-buyspace" => "= 0.1.2",
  "chub-castle" => "= 0.1.16",
  "chub-census" => "= 0.1.3",
  "chub-hornetq" => "= 0.1.0",
  "chub-klerk" => "= 0.10.4",
  "chub-openldap" => "= 1.12.14",
  "chub-plaza" => "= 0.1.4",
  "chub-sensu" => "= 0.1.7",
  "chub-vault" => "= 0.2.0",
  "chub_sensu_sso" => "= 0.1.11",
  "cron" => "= 1.2.6",
  "dmg" => "= 2.1.4",
  "elasticsearch" => "= 0.3.8",
  "erlang" => "= 1.5.0",
  "git" => "= 2.9.0",
  "graphite" => "= 0.1.4",
  "hostsfile" => "= 2.4.4",
  "iptables" => "= 0.12.0",
  "java" => "= 1.22.0",
  "logrotate" => "= 1.3.0",
  "metachef" => "= 3.0.4",
  "mongodb" => "= 0.13.4",
  "nodejs" => "= 1.3.0",
  "nscd" => "= 0.11.0",
  "ntp" => "= 1.5.4",
  "openssh" => "= 1.3.2",
  "openssl" => "= 1.1.0",
  "partial_search" => "= 1.0.8",
  "python" => "= 1.3.6",
  "rabbitmq" => "= 2.4.0",
  "redisio" => "= 1.7.1",
  "rsyslog" => "= 1.11.0",
  "runit" => "= 1.5.8",
  "sensu" => "= 0.8.0",
  "statsd" => "= 3.0.4",
  "sudo" => "= 2.2.2",
  "tomcat" => "= 0.15.2",
  "ulimit" => "= 0.3.2",
  "windows" => "= 1.30.0",
  "yum" => "= 3.1.2",
  "yum-epel" => "= 0.3.4",
  "yum-erlang_solutions" => "= 0.2.0"
})
default_attributes(
  "java" => {
    "install_flavor" => "oracle",
    "jdk_version" => "8",
    "jdk" => {
      "8" => {
        "x86_64" => {
          "url" => "http://artifactory01.nexus.commercehub.com/artifactory/java-distributions/jdk/8-b132/jdk-8-linux-x64.tar.gz"
        }
      }
    }
  },
  "elasticsearch" => {
    "version" => "1.1.0",
    "cluster" => {
      "name" => "esdev1"
    }
  }
)
