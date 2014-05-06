#
# Cookbook Name:: chub-buyspace
# Recipe:: default
#
# Copyright 2013, CommerceHub Inc.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

#Set some attributes:
# 'java' => {
# 	'install_flavor' => 'oracle',
# 	'oracle' => { "accept_oracle_download_terms" => true },
# 	'jdk_version' => 7
# },
# 'tomcat' => {
# 	'base_version' => 7,
# 	'loglevel' => 'WARN'
# }


# Enforcing needed settings, but these should be applied at the Role level

node.normal['tomcat']['base_version'] = 7
node.default['tomcat']['loglevel'] = 'WARN'		# default is 'INFO'

tempdir		= node['chub-buyspace']['temp_dir']			#puts "tempdir is #{tempdir}"
configdir	= node['chub-buyspace']['config_dir']
loggingconf	= node['chub-buyspace']['logging_conf'] 
grailsenv	= node['chub-buyspace']['grails_env']
appdir		= node['chub-buyspace']['app_dir']

node.set['tomcat']['java_options'] = "-Djava.base=/var/lib/tomcat7 -Djava.io.tmpdir=#{ tempdir } -Djava.util.logging.manager=org.apache.juli.ClassLoaderLogManager -Djava.util.logging.config.file=#{ configdir }/#{ loggingconf } -Dcom.sun.management.jmxremote=true -Dcom.sun.management.jmxremote.port=6006 -Dcom.sun.management.jmxremote.ssl=false -Dcom.sun.management.jmxremote.authenticate=false -Dgrails.env=#{ grailsenv } -XX:MaxPermSize=1024m -Dbase.dir=#{ appdir }/ROOT "


#if node[:instance_role] == 'vagrant'
if Chef::Config[:solo]
	node.set["tomcat"]["keystore_password"] = 'throwawaypassword'
	node.set["tomcat"]["truststore_password"] = 'throwawaypassword'
end

include_recipe "chub_java::oracle7"
include_recipe "tomcat"
include_recipe "chub-buyspace::buyspace"

