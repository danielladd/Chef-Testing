name "mpdemo1"
description "marketplace demo environment 1"
cookbook "chub-klerk", "= 0.10.4"
default_attributes "chub-klerk" => {
    "mongo_addresses" => [ "mpdemo1db1.commercehub.com:27017" ],
    "quartz_database_url" => "jdbc:jtds:sqlserver://sqlps/MPDemo1_Klerk_Quartz;user=Mpdemo1_Klerk_Admin;password=Adminuser01_MPDemo!",
    "hazelcast_group_name" => "mpdemo1_klerk",
    "hazelcast_group_password" => "NwicZ8LHuXoaUHV4",
    "antivirus_hosts" => [ "vscan.commercehub.com" ],
    "event_notification_endpoints" => {
        "productstream" => "http://mpdemo1app1.commercehub.com/klerk/productDataEvents"
    },
    "sprite_conductor_url" => "http://mpdemo1app1.commercehub.com:8060/sprite-conductor",
    "sprite_output_container_prefix" => "mpdemo1-"
}
