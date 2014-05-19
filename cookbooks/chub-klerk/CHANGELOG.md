chub-klerk Cookbook CHANGELOG
=======================
This file is used to list changes made in each version of the chub-klerk cookbook.

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

