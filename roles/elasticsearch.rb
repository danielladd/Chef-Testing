name "elasticsearch"
description "an elasticsearch cluster node"
run_list "role[pipeline_team]", "recipe[java]", "recipe[elasticsearch::search_discovery]", "recipe[elasticsearch]", "recipe[chub_elasticsearch]"
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
  })

