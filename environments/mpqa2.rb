name "mpqa2"
description "marketplace qa environment 2"
default_attributes "chub-klerk" => {
    "mongo_addresses" => [ "mpqa2db1:27017", "mpqa2db2:27017", "mpqa2db3:27017" ],
    "quartz_database_url" => "jdbc:jtds:sqlserver://sqlvm81/mpqa2_klerk_quartz;user=devusr01;password=usrdev",
    "hazelcast_group_name" => "mpqa2_klerk",
    "hazelcast_group_password" => "mpqa2_klerk",
    "antivirus_hosts" => [ "qa-scanengine.commercehub.com" ],
    "event_notification_endpoints" => {
        "productstream" => "http://mpqa2app1.nexus.commercehub.com/klerk/productDataEvents"
    }
}
