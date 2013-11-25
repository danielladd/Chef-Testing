name "mpprod1"
description "marketplace production environment 1"
default_attributes "chub-klerk" => {
    "mongo_addresses" => [ "mdb01:27017", "mdb02:27017", "mdb03:27017" ],
    "quartz_database_url" => "jdbc:jtds:sqlserver://sqlintv8/Klerk_Quartz;user=Klerk;password=Kusr01!",
    "hazelcast_group_name" => "mpprod1_klerk",
    "hazelcast_group_password" => "mpprod1_klerk",
    "antivirus_hosts" => [ "vs01", "vs02" ],
    "event_notification_endpoints" => {
        "productstream" => "http://api.buyspace.com/klerk/productDataEvents"
    },
    "sprite_url" => "http://sprite.buyspace.com/sprite-conductor"
}
