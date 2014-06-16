name "dev"
description "Development Environment"
default_attributes(
  "elasticsearch" => {
    "version" => "1.1.0",
    "cluster" => {
      "name" => "esdev1"
    }
  }, 
  "chub_logstash" => {
    "endpoint" => "lsdev.nexus.commercehub.com",
    "esgateway" => "esdev01.nexus.commercehub.com"
  }
)
