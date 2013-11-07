name "mpdev1"
description "marketplace dev environment 1"
default_attributes "mongodb" => {
    "package_version" => "2.2.6",
    "enable_rest" => true,
    "replicaset_name" => "mpdev1",
    "auto_configure" => {
        "replicaset" => false
    }
}, "chub-klerk" => {
    "mongo_addresses" => [ "mpdev1mongo1", "mpdev1mongo2", "mpdev1mongo3" ],
    "quartz_database_url" => "jdbc:jtds:sqlserver://sqlvm81/mpdev1_klerk_quartz;user=devusr01;password=usrdev",
    "hazelcast_group_name" => "mpdev1_klerk",
    "hazelcast_group_password" => "mpdev1_klerk"
}
