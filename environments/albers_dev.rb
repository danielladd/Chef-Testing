name "albers_dev"
description "Albers Development Environment"
default_attributes(
  "chub_albers" => {
    "jar_url" => ["http://artifactory01.nexus.commercehub.com/artifactory/libs-release-local/com/commercehub/AlbersService/%5BRELEASE%5D/AlbersService-%5BRELEASE%5D-shadow.jar;env.albers_dev.current+=true"],
    "metrics_environment" => "dev",
    "map_retention" => "144h",
    "dev_repo_url" => "http://hg03:5000/dev"
  },
  "elasticsearch" => {
    "version" => "1.1.0",
    "cluster" => {
      "name" => "esdev1"
    }
  },
  "chub_logstash" => {
    "endpoint" => "lsdev.nexus.commercehub.com",
    "esgateway" => "esdev.nexus.commercehub.com",
    "env_crt" => "dev"
  }
)
