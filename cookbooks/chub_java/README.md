# chub_java cookbook

Chef cookbook for easy access to Java loaded from our Artifactory server.

# Requirements

* Currently, Java 7 and 8 is supported on Ubuntu 12.04/14.04, and Java 7 is supported on Windows (though still somewhat buggy).  Support for other platforms/versions may be added in the future.
* Currently, only Oracle JDKs are supported.  OpenJDK support may be added in the future.
* Currently, only 64-bit machines are supported.
* Java 6 is intentionally not supported.
* It is currently not possible to use this cookbook to install multiple versions of Java on the same system.  We can consider this as a future enhancement if we have a need for it.

# Usage

If you have an application cookbook that requires Java, the preferred usage pattern is:

* In `metadata.rb`, add a line like this: `depends 'chub_java', '= VERSION'`, where VERSION is the desired version of this cookbook.
* In your recipe, add a line like this: `include_recipe 'RECIPE'`, where RECIPE is one of the recipes listed below.

If for some reason you have a need to install Java on a system, but don't have an appropriate cookbook, you can add these recipes directly to a role's `run_list`.

# Recipes

* `chub_java::default`: installs an arbitary version of Java (currently Oracle Java 7)
* `chub_java::oracle7`: installs Oracle Java 7
* `chub_java::oracle8`: installs Oracle Java 8

# Testing

There are automated tests using [Test Kitchen](http://kitchen.ci/).  Run them using `kitchen test`.
