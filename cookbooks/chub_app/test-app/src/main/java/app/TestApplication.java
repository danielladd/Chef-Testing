package app;

import io.dropwizard.Application;
import io.dropwizard.setup.Bootstrap;
import io.dropwizard.setup.Environment;

import java.util.Arrays;

public class TestApplication extends Application<TestConfiguration> {
    public static void main(String[] args) throws Exception {
        System.out.println("Environment variables: " + System.getenv());
        System.out.println("Arguments: " + Arrays.asList(args));
        new TestApplication().run(args);
    }

    @Override
    public void initialize(Bootstrap<TestConfiguration> bootstrap) { }

    @Override
    public void run(TestConfiguration configuration, Environment environment) throws Exception {
        environment.jersey().register(RootResource.class);
    }
}
