name "albers_prod"
description "Albers Production Environment"
default_attributes(
  "chub_albers" => {
	"jar_url" => ["http://artifactory01.nexus.commercehub.com/artifactory/libs-release-local/com/commercehub/AlbersService/%5BRELEASE%5D/AlbersService-%5BRELEASE%5D-shadow.jar;env.albers_prod.current+=true"],
    "metrics_environment" => "prod",
    "map_retention" => "288h",
    "dev_repo_url" => "http://hg05:5000/dev"
  }
)
