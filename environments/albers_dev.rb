name "albers_dev"
description "Albers Development Environment"
default_attributes(
  "node" => {
	"java_url" => ["http://bamboom1:8085/browse/AL-ASNAP/latest/artifact/shared/Albers-Service-Shadow-Jar/AlbersService-shadow.jar?os_username=chef_user&os_password=chef_user"],
  "metrics_environment" => ["dev"]
  }
)

default_attributes(
  "elasticsearch" => {
    "version" => "1.1.0",
    "cluster" => {
      "name" => "esdev1"
    }
  },
  "chub_logstash" => {
    "endpoint" => "lsdev.nexus.commercehub.com",
    "esgateway" => "esdev.nexus.commercehub.com"
  }
)
