name "mpdev"
default_attributes(
    "chub-klerk" => {
        "app_url" => "http://mpbamboo.nexus.commercehub.com/browse/BS-KLER/latestSuccessful/artifact/shared/app.jar/klerk-app-0.0.1-SNAPSHOT-all.jar",
        "mongo_uri" => "mongodb://192.168.33.1:27017/?maxPoolSize=50",
        "blobstore_mongo_uri" => "mongodb://192.168.33.1:27017/?maxPoolSize=50",
        "quartz_database_url" => "jdbc:h2:data/quartz;MVCC=TRUE",
        "hazelcast_group_name" => "mpdev_klerk",
        "hazelcast_group_password" => "seYsD3123f2HEpb5",
        "antivirus_hosts" => [ "qascanengine.nexus.commercehub.com" ],
        "product_data_event_endpoints" => {
            "productstream" => "http://192.168.33.1:8080/marketplace/klerk/productDataEvents"
        },
        "product_data_application_metadata_update_job_finished_event_endpoint" => "jms:queue:KlerkProductDataApplicationMetadataUpdateJobFinishedEventQueue",
        "dead_product_data_application_metadata_update_job_finished_event_endpoint" => "jms:queue:KlerkProductDataApplicationMetadataUpdateJobFinishedEventDLQ",
        "jms_provider_url" => "jnp://192.168.33.1:1099",
        "sprite_conductor_url" => "http://192.168.33.1:8060/sprite-conductor",
        "sprite_output_container_prefix" => "mpdev-",
        "sprite_notification_id" => "klerk",
        "sprite_manifest_update_notification_endpoint" => "jms:queue:KlerkSPRITEManifestUpdateNotificationQueue",
        "java_heap_size" => "256m"
    }
)

