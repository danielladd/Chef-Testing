name "zookeeper"
description "a zookeeper node"
run_list "recipe[zookeeper]"
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
  "zookeeper" => {
    "version" => "3.4.5",
    "user" => "zookeeper",
    "install_dir" => "/opt/zookeeper",
    "config" => {
      "clientPort" => "2181",
      "dataDir" => "/opt/zookeeper/data",
      "tickTime" => "2000",
      "autopurge" => {
        "snapRetainCount" => 1,
        "purgeInterval" => 1
      }
    }
  }
)

