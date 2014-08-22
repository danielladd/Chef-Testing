name "chub-klerk"
description "Installs and configures the Klerk application"
version "4.1.0"
supports "ubuntu"

depends "sudo"
depends "chub_java", "= 0.1.1"

recipe "chub-klerk", "Main Klerk recipe"

attribute "chub-klerk",
    "display_name" => "Klerk",
    "description" => "Hash of Klerk attributes",
    "type" => "hash"

attribute "chub-klerk/app_url",
    "display_name" => "Klerk application URL",
    "description" => "URL from which to obtain the application JAR; can use a remote URL such as http://mpbamboo.nexus.commercehub.com/browse/BS-KLER/latestSuccessful/artifact/shared/app.jar/klerk-app-0.0.1-SNAPSHOT-shadow.jar to pull a jar from CI",
    "default" => "file:///var/opt/klerk/staged-klerk-app.jar"

attribute "chub-klerk/mongo_uri",
    "display_name" => "Klerk MongoDB connection string URI",
    "description" => "The connection string URI to connect Klerk to MongoDB for its primary data storage"

attribute "chub-klerk/klerk_database_name",
    "display_name" => "Klerk database name",
    "description" => "The name of the Klerk database",
    "default" => "klerk"

attribute "chub-klerk/blobstore_database_name",
    "display_name" => "Klerk blob store database name",
    "description" => "The name of the Klerk blob store database",
    "default" => "klerk_blobStore"

attribute "chub-klerk/blobstore_mongo_uri",
    "display_name" => "Klerk blob store MongoDB connection string URI",
    "description" => "The connection string URI to connect Klerk to MongoDB for blob storage"

attribute "chub-klerk/java_heap_size",
    "display_name" => "Klerk Java heap size",
    "description" => "The heap size with which to run the Klerk JVM",
    "default" => "1g"

attribute "chub-klerk/hazelcast_group_name",
    "display_name" => "Hazelcast Group Name"

attribute "chub-klerk/hazelcast_group_password",
    "display_name" => "Hazelcast Group Password"

attribute "chub-klerk/product_data_event_endpoints",
    "display_name" => "Product Data Event Endpoints",
    "type" => "hash"

attribute "chub-klerk/product_data_application_metadata_update_job_finished_event_endpoint",
    "display_name" => "Product Data Application Metadata Update Job Finished Event Endpoint"

attribute "chub-klerk/dead_product_data_application_metadata_update_job_finished_event_endpoint",
    "display_name" => "Dead Product Data Application Metadata Update Job Finished Event Endpoint"

attribute "chub-klerk/antivirus_hosts",
    "display_name" => "Antivirus Hosts",
    "type" => "array"

attribute "chub-klerk/sprite_conductor_url",
    "display_name" => "Sprite Conductor URL"

attribute "chub-klerk/sprite_output_container_prefix",
    "display_name" => "Sprite Output Container Prefix"

attribute "chub-klerk/sprite_notification_id",
    "display_name" => "Sprite notification ID",
    "description" => "The notification id to include in Sprite manifests sent to the Sprite Conductor"

attribute "chub-klerk/sprite_manifest_update_notification_endpoint",
    "display_name" => "Sprite manifest Update notification endpoint",
    "description" => "The JMS endpoint to listen to for Sprite manifest updates"

attribute "chub-klerk/jms_provider_url",
    "display_name" => "JMS Provider URL"
