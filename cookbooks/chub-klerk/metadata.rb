name "chub-klerk"
description "Installs and configures the Klerk application"
version "0.1.0"
supports "ubuntu"
depends "java"

recipe "chub-klerk", "Main Klerk recipe"

attribute "chub-klerk",
    "display_name" => "Klerk",
    "description" => "Hash of Klerk attributes",
    "type" => "hash"

attribute "chub-klerk/app_url",
    "display_name" => "Klerk application URL",
    "description" => "URL from which to download the application JAR",
    "default" => "http://mpbamboo.nexus.commercehub.com/browse/BS-KLER/latestSuccessful/artifact/shared/app.jar/klerk-app-0.0.1-SNAPSHOT-shadow.jar"

attribute "chub-klerk/mongo_host",
    "display_name" => "Klerk MongoDB host",
    "description" => "The MongoDB host to connect to"

attribute "chub-klerk/mongo_port",
    "display_name" => "Klerk MongoDB port",
    "description" => "The MongoDB port to connect to",
    "default" => "27017"

attribute "chub-klerk/klerk_database_name",
    "display_name" => "Klerk database name",
    "description" => "The name of the Klerk database",
    "default" => "klerk"

attribute "chub-klerk/blobstore_database_name",
    "display_name" => "Klerk blob store database name",
    "description" => "The name of the Klerk blob store database",
    "default" => "blobStore"

attribute "chub-klerk/quartz_database_url",
    "display_name" => "Klerk Quartz database URL",
    "description" => "The JDBC URL for the Quartz database"

attribute "chub-klerk/java_heap_size",
    "display_name" => "Klerk Java heap size",
    "description" => "The heap size with which to run the Klerk JVM",
    "default" => "512M"
