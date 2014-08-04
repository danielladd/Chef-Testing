name             'chub_plaza'
maintainer       'David M. Carr'
maintainer_email 'dcarr@commercehub.com'
license          'All rights reserved'
description      'Installs/Configures Plaza'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '0.3.2'

supports "ubuntu"
depends "chub_java"

attribute "chub_plaza/app_url",
    :display_name => "Plaza application URL",
    :description => "URL from which to obtain the application JAR; can use a remote URL",
    :required => "optional",
    :default => "http://mpbamboo.nexus.commercehub.com/browse/SSO-PLAZA/latestSuccessful/artifact/shared/plaza.jar/plaza.jar"

attribute "chub_plaza/app_context",
    :display_name => "Application context",
    :description => "The path under which the application will be deployed (used in URLs)",
    :required => "optional"

attribute "chub_plaza/app_root_url",
    :display_name => "Application root URL",
    :description => "The root URL of the application, used for redirects",
    :required => "optional"

attribute "chub_plaza/java_heap_size",
    :display_name => "Plaza Java heap size",
    :description => "The heap size with which to run the Plaza JVM",
    :required => "optional",
    :default => "512M"

attribute "chub_plaza/cas_server_url",
    :display_name => "CAS Server URL",
    :description => "The root URL of a CAS instance to use for SSO",
    :required => "required"

attribute "chub_plaza/cas_service_url",
    :display_name => "CAS Service URL",
    :description => "The service URL to pass to CAS (should end in /shiro-cas)",
    :required => "required"

attribute "chub_plaza/cas_failure_url",
    :display_name => "CAS Failure URL",
    :description => "Where to send users when service ticket validation fails",
    :required => "required"

attribute "chub_plaza/census_url",
    :display_name => "Census URL",
    :description => "The URL for Census",
    :required => "required"

attribute "chub_plaza/greenmail/disabled",
    :display_name => "Greenmail disabled",
    :description => "Whether to disable Greenmail",
    :required => "optional",
    :default => "true"

attribute "chub_plaza/mail/disabled",
    :display_name => "Mail disabled",
    :description => "Whether to disable mail",
    :required => "optional",
    :default => "false"

attribute "chub_plaza/mail/host",
    :display_name => "Mail host",
    :description => "Server to use for sending mail",
    :required => "optional"

attribute "chub_plaza/mail/port",
    :display_name => "Mail port",
    :description => "Port to use for sending mail",
    :required => "optional"

attribute "chub_plaza/mail/username",
    :display_name => "Mail username",
    :description => "Username to use for sending mail",
    :required => "optional"

attribute "chub_plaza/mail/password",
    :display_name => "Mail password",
    :description => "Password to use for sending mail",
    :required => "optional"

attribute "chub_plaza/mail/override_address",
    :display_name => "Mail override address",
    :description => "The address to use for all from and recipient addresses for sent mail",
    :required => "optional"

attribute "chub_plaza/applicationURLs/buyspace",
    :display_name => "Buyspace URL",
    :description => "The URL for the buyspace applicaiton",
    :required => "optional"

attribute "chub_plaza/applicationURLs/productstream",
    :display_name => "Productstream URL",
    :description => "The URL for the productstream applicaiton",
    :required => "optional"

attribute "chub_plaza/applicationURLs/orderstream",
    :display_name => "Orderstream URL",
    :description => "The URL for the orderstream applicaiton",
    :required => "optional"    

attribute "chub_plaza/hazelcast/group", :required => "optional"
attribute "chub_plaza/hazelcast/password", :required => "required"
attribute "chub_plaza/hazelcast/network_port", :required => "optional"
attribute "chub_plaza/hazelcast/multicast_group", :required => "optional"
attribute "chub_plaza/hazelcast/multicast_port", :required => "optional"
attribute "chub_plaza/hazelcast/backup_count", :required => "optional"
attribute "chub_plaza/hazelcast/minimum_member_count", :required => "optional"

attribute "graphite/host", :required => "recommended"
attribute "graphite/port", :required => "optional"
