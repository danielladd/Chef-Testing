name "mpdev"
default_attributes(
    "chub-klerk" => {
        "mongo_addresses" => [ "192.168.33.1:27017" ],
        "quartz_database_url" => "jdbc:h2:data/quartz;MVCC=TRUE",
        "hazelcast_group_name" => "mpdev_klerk",
        "hazelcast_group_password" => "seYsD3123f2HEpb5",
        "antivirus_hosts" => [ "qascanengine.nexus.commercehub.com" ],
        "product_data_event_endpoints" => {
            "productstream" => "http://192.168.33.1:8080/marketplace/klerk/productDataEvents"
        },
        "product_data_application_metadata_update_job_finished_event_endpoint" => "jms:queue:KlerkProductDataApplicationMetadataUpdateJobFinishedEventQueue",
        "sprite_conductor_url" => "http://192.168.33.1:8060/sprite-conductor",
        "sprite_output_container_prefix" => "mpdev-"
    }
)
