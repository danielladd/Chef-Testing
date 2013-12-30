name "mpdemo1"
description "marketplace demo environment 1"
default_attributes "chub-klerk" => {
    "mongo_addresses" => [ "new.commercehub.com:27017" ],
    "quartz_database_url" => "jdbc:jtds:sqlserver://sqlvm81/mpdemo1_klerk_quartz;user=devusr01;password=usrdev",
    "hazelcast_group_name" => "mpdemo1_klerk",
    "hazelcast_group_password" => "NwicZ8LHuXoaUHV4",
    "antivirus_hosts" => [ "qa-scanengine.commercehub.com" ],
    "event_notification_endpoints" => {
        "productstream" => "http://new.commercehub.com/klerk/productDataEvents"
    },
    "sprite_conductor_url" => "http://new.commercehub.com/sprite-conductor",
    "sprite_output_container_prefix" => "mpdemo1-"
}
