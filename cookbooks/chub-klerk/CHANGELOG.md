chub-klerk Cookbook CHANGELOG
=======================
This file is used to list changes made in each version of the chub-klerk cookbook.

v6.0.0
------
- Change the format for configuring blobstores
- Add  `blobstore_container_name`, `blobstore_context_type`, `blobstore_aws_s3_access_key_id`, and `blobstore_aws_s3_secret_key` attributes to support new blobstore configuration and using an AWS S3 blobstore
- Remove `blobstore_database_name` and `blobstore_mongo_uri` attributes that were used for the previous blobstore configuration

v5.1.0
------
- Add support for configuration of logstash logging appender

v5.0.0
------
- Remove `quartz_database_url` and related scheduler configuration from `klerk.yml` as Quartz has been removed from Klerk

v4.1.0
------
- Add Sprite configuration attributes `notification_id` and `manifest_update_notification_endpoint` to facilitate Klerk listening for Sprite manifest updates messages sent from Sprite Conductor

v4.0.0
------
- Generate `klerk.yml` using Klerk's refactored Mongo configuration properties
  - Replace `mongo_addresses` attribute with `mongo_uri`; the value is expected to be a [standard MongoDB connection string][1].
  - Add new `blobstore_mongo_uri` attribute; the value is expected to be a [standard MongoDB connection string][1].

v3.0.0
------
- Update klerk.yml template to support Klerk's upgrade to Dropwizard 0.7.x
- Increase heap size to 1g

v2.0.0
------
- Upgrade to JDK 8
- Remove support for specification of JVM permanent generation size as it is no longer applicable as of Java 8
- Remove use of hostsfile cookbook; the base cookbook covers the usage that was removed

v1.0.0
------
- Update klerk yaml template to reflect restructured and added config values
- Rename `event_notification_endpoints` attribute to `product_data_event_endpoints` as it's now only related to a specfic type of endpoint
- Introduce `product_data_application_metadata_update_job_finished_event_endpoint` attribute
- Introduce JMS configuration section to enable communication with HornetQ
- NOTE: as these changes are not backwards compatible, we decided to bump the version to 1.0.0 along with the semver definition

v0.10.7
-------
- Replace use of java::default recipe with chub_java::oracle7 recipe

v0.10.6
-------
- Revert jdk_version to 7
- Reintroduce support for specification of JVM permanent generation size

v0.10.5
-------
- Update java cookbook version constraint to 1.22.0
- Update jdk_version to 8
- Remove support for specification of JVM permanent generation size as it is no longer applicable as of Java 8

v0.10.4
-------
- Add support for specification of JVM permanent generation size via attribute `java_perm_gen_size`, with a default value of `128m`

v0.10.3
-------
- Update klerk Upstart config. to enable monitoring and management from remote systems via JMX on port 6006
- Replace 127.0.1.1 in /etc/hosts with node's actual permanent IP address

v0.10.2
-------
- Update java cookbook version constraint to 1.19.2

[1]: http://docs.mongodb.org/manual/reference/connection-string/ "MongoDB Connection String URI Format"