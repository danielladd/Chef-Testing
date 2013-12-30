name "new"
description "marketplace new environment"
default_attributes "chub-klerk" => {
    "mongo_addresses" => [ "new.commercehub.com:27017" ],
    "quartz_database_url" => "jdbc:jtds:sqlserver://sqlvm81/new_klerk_quartz;user=devusr01;password=usrdev",
    "hazelcast_group_name" => "new_klerk",
    "hazelcast_group_password" => "NwicZ8LHuXoaUHV4",
    "antivirus_hosts" => [ "qa-scanengine.commercehub.com" ],
    "event_notification_endpoints" => {
        "productstream" => "http://new.commercehub.com/klerk/productDataEvents"
    },
    "sprite_conductor_url" => "http://new.commercehub.com/sprite-conductor",
    "sprite_output_container_prefix" => "new-"
}
