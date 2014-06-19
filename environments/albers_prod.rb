name "albers_prod"
description "Albers Production Environment"
default_attributes(
  "node" => {
	"java_url" => ["http://artifactory01.nexus.commercehub.com/artifactory/libs-release-prod/com/commercehub/AlbersService/%5BRELEASE%5D/AlbersService-%5BRELEASE%5D-shadow.jar"],
    "metrics_environment" => ["prod"]
  }
)
