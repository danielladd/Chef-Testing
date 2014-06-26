name "albers_prod"
description "Albers Production Environment"
default_attributes(
  "chub_albers" => {
	"java_url" => ["http://artifactory01.nexus.commercehub.com/artifactory/libs-release-local/com/commercehub/AlbersService/%5BRELEASE%5D/AlbersService-%5BRELEASE%5D-shadow.jar;env.albersprod.current+=true"],
    "metrics_environment" => "prod"
  }
)
