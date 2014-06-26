name "albers_dev"
description "Albers Development Environment"
default_attributes(
  "chub_albers" => {
  "jar_url" => ["http://artifactory01.nexus.commercehub.com/artifactory/libs-release-local/com/commercehub/AlbersService/%5BRELEASE%5D/AlbersService-%5BRELEASE%5D-shadow.jar;env.albersdev.current+=true"],
  "metrics_environment" => "dev"
  },
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
