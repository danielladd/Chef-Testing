name             'chub_scm'
maintainer       'Adrian Uribe'
maintainer_email 'auribe@commercehub.com'
license          'All rights reserved'
description      'Installs/Configures Sensu in the CommerceHub way for SCM'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '0.1.0'

depends "sensu"
depends "base"
depends "partial_search"
depends "chub_sensu"


attribute "chub_sensu/email/recipient",
    :display_name => "Email notification recipient",
    :description => "The email address which will receive email notifications",
    :type => "string"

attribute "graphite/host",
    :display_name => "Graphite Server Host",
    :description => "If planning to integrate with Graphite the hostname for the server to be used",
    :type => "string",
    :required => "optional"

attribute "graphite/port",
    :display_name => "Graphite Server Port",
    :description => "If planning to integrate with Graphite the port for the server to be used",
    :type => "string",
    :required => "optional"

attribute "chub_sensu/email/subscriptions_mail_to",
    :display_name => "Subscriptions Mail To",
    :description => "A hash of mail_to addresses for a given subscription",
    :type => "hash",
    :required => "optional"

attribute "chub_sensu/email/subscriptions_mail_to/<subscription_name>",
    :display_name => "A subscription name and mail_to value",
    :description => "A subscription name and corresponding mail_to address as the value",
    :type => "string",
    :required => "optional"