name "logstash_dev"
description "a logstash server running in dev"
run_list *%w[
    recipe[java]
    recipe[chub_logstash]
    recipe[chub_logstash::server]
    role[albers]
    role[chef_logs]
    role[rundeck_logs]
    role[sensu_mq_logs]
    role[apartment_log]
    role[oddrest_log]
    role[rolodex_log]
    role[jenkins_logs]
    role[bamboo01_logs]
    role[bambooM1_logs]
    role[artifactory_logs]
]

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
  "chub_logstash" => {
    "logstash_tar" => "logstash-1.4.1.tar.gz"
  })
