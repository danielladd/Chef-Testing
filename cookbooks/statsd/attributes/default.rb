
#
# Locations
#

default[:statsd][:home_dir]			= "/opt/statsd"
default[:statsd][:conf_dir]			= "/etc/statsd"
default[:statsd][:log_dir]			= "/var/log/statsd"
default[:statsd][:pid_dir]			= "/var/run/statsd"

default[:statsd][:user] 			= "statsd"
default[:users ]['statsd' ][:uid]	= 310
default[:groups]['statsd' ][:gid]	= 310

default[:statsd][:run_state]		= :start

default[:statsd][:graphite][:port]	= 2003
default[:statsd][:graphite][:addr]	= "localhost"
default[:statsd][:port]				= 8125
default[:statsd][:debug]			= "true"

#
# Install
#

default[:statsd][:git_repo]			= "https://github.com/etsy/statsd.git"

#
# Tunables
#

default[:statsd][:flush_interval]	= 60000 #milliseconds between flushes
