default[:sensu][:use_ssl] = false
default[:chub_sensu][:email][:sender] = 'sensu@commercehub.com'
default[:chub_sensu][:email][:smtp_server] = 'mail.commercehub.com'
default[:chub_sensu][:email][:smtp_port] = 25
default[:chub_sensu][:email][:smtp_domain] = 'commercehub.com'


default[:chub_sensu][:root_sensu_community_plugins_repo_url] = "https://git.nexus.commercehub.com/mirrors/sensu-community-plugins/raw/master"

default[:chub_sensu][:root_plugin_path] = '/etc/sensu/plugins'
default[:chub_sensu][:root_handler_path] = '/etc/sensu/handlers'
default[:chub_sensu][:root_handler_config_path] = '/etc/sensu/conf.d/handlers'
default[:chub_sensu][:admin_gui_url] = "http://monapp01:3000"


# Redis Sentinel
default[:sensu][:redis][:quorum_count] = 1
default[:chub_sensu][:redis][:check_redis_root] = "/opt/check_redis_master"
default[:chub_sensu][:redis][:check_redis_file] = "redis-role.sh"

default[:sensu][:rabbitmq][:heartbeat] = 120
default[:sensu][:init_style] = "runit"

default[:redisio][:default_settings][:logfile] = "/var/log/redis.log"
