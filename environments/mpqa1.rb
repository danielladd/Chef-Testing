name "mpqa1"
description "marketplace qa environment 1"
cookbook "chub-klerk", "= 1.0.0"
default_attributes "chub-klerk" => {
    "mongo_addresses" => [ "mpqa03:27777", "mpqa05:27777" ],
    "quartz_database_url" => "jdbc:jtds:sqlserver://sqlvm81/mpqa1_klerk_quartz;user=devusr01;password=usrdev",
    "hazelcast_group_name" => "mpqa1_klerk",
    "hazelcast_group_password" => "mpqa1_klerk",
    "antivirus_hosts" => [ "qa-scanengine.commercehub.com" ],
    "product_data_event_endpoints" => {
        "productstream" => "http://mpqa01.nexus.commercehub.com:17070/klerk/productDataEvents"
    },
    "product_data_application_metadata_update_job_finished_event_endpoint" => "jms:queue:KlerkProductDataApplicationMetadataUpdateJobFinishedEventQueue",
    "sprite_conductor_url" => "http://mpqa05.nexus.commercehub.com:8080/sprite-conductor",
    "sprite_output_container_prefix" => "mpqa1-",
    "jms_provider_url" => "jnp://mpqa03.nexus.commercehub.com:7099"
}
