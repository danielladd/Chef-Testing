name "dev"
default_attributes(
    "chub-plaza" => {
        "cas_server_url" => "https://castle.vagrant.dev",
        "cas_service_url" => "http://plaza.vagrant.dev:8080/shiro-cas",
        "graphite_host" => "stats02.nexus.commercehub.com"
    }
)
