name "albers_nonprod"
description "Albers Non-Production Environment"
default_attributes(
  "chub_albers" => {
	"jar_url" => ["http://artifactory01.nexus.commercehub.com/artifactory/libs-release-local/com/commercehub/AlbersService/%5BRELEASE%5D/AlbersService-%5BRELEASE%5D-shadow.jar;env.albers_nonprod.current+=true"],
    "metrics_environment" => "non-prod"
  },
  "chub_logstash" => {
    "env_crt" => "dev"
  }
)
