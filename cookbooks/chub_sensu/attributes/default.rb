default[:sensu][:use_ssl] = false
default[:chub_sensu][:email][:sender] = 'sensu@commercehub.com'
default[:chub_sensu][:email][:smtp_server] = 'mail.commercehub.com'
default[:chub_sensu][:email][:smtp_port] = 25
default[:chub_sensu][:email][:smtp_domain] = 'commercehub.com'

default[:chub_sensu][:root_plugin_path] = '/etc/sensu/plugins'
default[:chub_sensu][:root_handler_path] = '/etc/sensu/handlers'
default[:chub_sensu][:root_handler_config_path] = '/etc/sensu/conf.d/handlers'
