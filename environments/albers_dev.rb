name "albers_dev"
description "Albers Development Environment"
override_attributes(
  "node" => {
	"java_url" => ["http://bamboom1:8085/browse/AL-ASNAP/latest/artifact/shared/Albers-Service-Shadow-Jar/AlbersService-shadow.jar?os_username=chef_user&os_password=chef_user"]
    }
)
