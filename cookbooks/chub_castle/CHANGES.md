# 0.1.22
* Add support for chub_castle/domain

# 0.1.21
* Make castle group append
* Update Berksfile/Vagrantfile to work with latest versions of Berkshelf/Vagrant

# 0.1.20
* Add default_service_url attribute

# 0.1.19
* Add forgot_password_url attribute

# 0.1.18
* Add support for remote JMX

# 0.1.17
* Add default for chub_castle/hazelcast/group based on environment
* Add default hazelcast service_ticket_timeout and ticket_granting_ticket_timeout
* Use chub_java cookbook
* Add initial chefspec tests

# 0.1.16
* Clean up cookbook
* Specify minimum java cookbook version

# 0.1.15
* Ripped out all of the database stuff, added in hazelcast

# 0.1.14
* Add host name property for proper node identification.

# 0.1.13
* Fix runtime arg for the jar

# 0.1.12
* Typo in graphite environment property

# 0.1.11
* Property file changes to support the addition of a c3p0 connection pool

# 0.1.10
* Added codahale metrics and support for outputting them to the graphite server.

# 0.1.9

* Added ticket registry support and properties for connecting to a database

# 0.1.8

* Fix upstart script

# 0.1.7

* Remove the last trace of authbind

# 0.1.6

* Run on ports 8080/8443 rather than 80/443 (stop using authbind)
* Use container keystore/truststore separate from system keystore/truststore
* Prefer name "castle.properties" over "application.properties"

# 0.1.5

* Cleanup of default properties for the vault connection

# 0.1.4

* Add support for an application properties file to point castle to the correct vault url.

# 0.1.2

* Add support for running on port 80
