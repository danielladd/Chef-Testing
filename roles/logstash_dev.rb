name "logstash_dev"
description "a logstash server running in dev"
run_list "recipe[java]", "role[albers]", "recipe[chub_logstash]", "recipe[chub_logstash::server]"
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

