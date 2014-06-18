name "kafka_dev"
description "a kafka node running in dev"
run_list "recipe[kafka]"
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
  "kafka" => {
    "version" => "kafka_2.9.2-0.8.1.1",
    "download_url" => "http://mirror.tcpdiag.net/apache/kafka/0.8.1.1",
    "checksum" => "7541ed160f1b3aa1a5334d4e782ba4d3"
  }
)

