name "mpqa1"
description "marketplace qa environment 1"
default_attributes "chub-klerk" => {
    "mongo_addresses" => [ "mpqa03:27777", "mpqa05:27777" ],
    "quartz_database_url" => "jdbc:h2:/var/opt/klerk/data/quartz;MVCC=TRUE"
}
