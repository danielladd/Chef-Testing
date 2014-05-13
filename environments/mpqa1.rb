name "mpqa1"
description "marketplace qa environment 1"
cookbook "chub-klerk", "= 0.10.7"
default_attributes "chub-klerk" => {
    "mongo_addresses" => [ "mpqa03:27777", "mpqa05:27777" ],
    "quartz_database_url" => "jdbc:jtds:sqlserver://sqlvm81/mpqa1_klerk_quartz;user=devusr01;password=usrdev",
    "hazelcast_group_name" => "mpqa1_klerk",
    "hazelcast_group_password" => "mpqa1_klerk",
    "antivirus_hosts" => [ "qa-scanengine.commercehub.com" ],
    "event_notification_endpoints" => {
        "productstream" => "http://mpqa01.nexus.commercehub.com:17070/klerk/productDataEvents"
    },
    "sprite_conductor_url" => "http://mpqa05.nexus.commercehub.com:8080/sprite-conductor",
    "sprite_output_container_prefix" => "mpqa1-"
}
cookbook_versions({
  "hostsfile" => "= 2.4.4",
  "python"  => "= 1.3.6",
  "build-essential" => "= 2.0.0",
  "windows"  => "= 1.11.0",
  "mercurial"  => "= 2.0.5",
  "apt"  => "= 2.1.1",
  "chef-kick"  => "= 0.1.0",
  "ntp"  => "= 1.5.4",
  "cron"  => "= 1.2.6",
  "chef-client"  => "= 3.0.6",
  "yum"  => "= 3.0.6",
  "yum-epel"  => "= 0.2.0",
  "runit"  => "= 1.2.0",
  "chef_handler"  => "= 1.1.4",
  #depends "dmg", "= "
  "git"  => "= 2.6.0",
  "base" => "= 0.1.15",
  "openssl"  => "= 1.1.0",
  "java"  => "= 1.22.0",
  "tomcat"  => "= 0.15.2",
  "chub_java"  => "= 0.1.0"
})