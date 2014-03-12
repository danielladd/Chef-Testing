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
