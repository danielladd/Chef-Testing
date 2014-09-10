default[:chub_orderstream_iis][:default_app_pool_config][:managed_runtime_version ] = "4.0"
default[:chub_orderstream_iis][:default_site_root] = "C:/netpub/wwwroot"
default[:chub_orderstream_iis][:orderstream_site_name] = "OrderStream"
default[:chub_orderstream_iis][:orderstream_site_root] = "C:/inetpub/orderstream"
default[:chub_orderstream_iis][:orderstream_site_binding] = "*:443:"
default[:chub_orderstream_iis][:orderstream_site_ssl_enabled] = "true"
default[:chub_orderstream_iis][:orderstream_site_protocol] = :https