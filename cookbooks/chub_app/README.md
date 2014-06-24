A cookbook for "standard" Hub applications.  These are applications that do not require a custom per-application cookbook/recipe, because
they abide by certain simplifying conventions.

Some concepts used here, such as configuration exclusively by environment variable, are pulled from
[The Twelve-Factor App](http://12factor.net/).

To get started:
* Configure the following attributes for your node, role, or environment (all other than app_url are optional):
    * chub_app/app_url
    * chub_app/app_env
    * chub_app/app_args
    * chub_app/jvm_args
* Add chub_app::jar to your run_list.

For testing purposes:
* `cd test-app`
* `./gradlew clean build`
* `cd ..`
* `cp test-app/build/distributions/app-shadow.jar ./app.jar`
* `vagrant up`
* At this point, the app has been installed and run as a service.
* The service can be accessed from the host at http://192.168.24.90:8080/.
