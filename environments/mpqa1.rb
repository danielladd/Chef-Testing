name "mpqa1"
description "marketplace qa environment 1"
default_attributes "chub-klerk" => {
    "mongo_addresses" => [ "mpqa03:27777", "mpqa05:27777" ],
    "quartz_database_url" => "jdbc:jtds:sqlserver://sqlvm81/mpqa1_klerk_quartz;user=devusr01;password=usrdev",
    "hazelcast_group_name" => "mpqa1_klerk",
    "hazelcast_group_password" => "mpqa1_klerk",
    "event_notification_endpoints" => {
        "productstream" => "https://qa-vip7.buyspace.com/klerk/productDataEvents"
    }
}
