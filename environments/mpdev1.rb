name "mpdev1"
description "marketplace dev environment 1"
default_attributes "chub-klerk" => {
    "mongo_addresses" => [ "mpdev1mongo1", "mpdev1mongo2", "mpdev1mongo3" ],
    "quartz_database_url" => "jdbc:jtds:sqlserver://sqlvm81/mpdev1_klerk_quartz;user=devusr01;password=usrdev"
}
