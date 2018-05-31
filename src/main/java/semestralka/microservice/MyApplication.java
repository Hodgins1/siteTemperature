/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package semestralka.microservice;

/**
 *
 * @author Robert Sochuliak
 */
import io.dropwizard.Application;
import io.dropwizard.assets.AssetsBundle;
import io.dropwizard.auth.AuthDynamicFeature;
import io.dropwizard.auth.AuthValueFactoryProvider;
import io.dropwizard.auth.basic.BasicCredentialAuthFilter;
import io.dropwizard.db.PooledDataSourceFactory;
import io.dropwizard.hibernate.HibernateBundle;
import io.dropwizard.setup.Bootstrap;
import io.dropwizard.setup.Environment;
import io.dropwizard.views.ViewBundle;
import java.util.Map;
import org.glassfish.jersey.server.filter.RolesAllowedDynamicFeature;
import org.hibernate.SessionFactory;


public class MyApplication extends Application<MyAplicationConfiguration> {

    static SessionFactory buildSessionFactory;

    private final HibernateBundle<MyAplicationConfiguration> hibernateBundle = new HibernateBundle<MyAplicationConfiguration>(Temperature.class) {
        @Override
        public PooledDataSourceFactory getDataSourceFactory(MyAplicationConfiguration t) {
            return t.getDataSourceFactory();
        }
    };

    public static void main(String[] args) throws Exception {

        new MyApplication().run(args);
    }

    @Override
    public String getName() {
        return "hello-world";
    }

    @Override
    public void initialize(Bootstrap<MyAplicationConfiguration> bootstrap) {

        bootstrap.addBundle(hibernateBundle);
        bootstrap.addBundle(new AssetsBundle());
        bootstrap.addBundle(new ViewBundle<MyAplicationConfiguration>() {
            @Override
            public Map<String, Map<String, String>> getViewConfiguration(MyAplicationConfiguration configuration) {

                return super.getViewConfiguration(configuration); //To change body of generated methods, choose Tools | Templates.
            }
        });
    }

    @Override
    public void run(MyAplicationConfiguration configuration,
            Environment environment) {

        final TemperatureDAO dao = new TemperatureDAO(hibernateBundle.getSessionFactory());

        final TemperatureResource temperatureResource = new TemperatureResource(dao);

        final TemplateHealthCheck healthCheck
                = new TemplateHealthCheck(configuration.getTemplate());

        environment.jersey().register(new AuthDynamicFeature(new BasicCredentialAuthFilter.Builder<User>()
                .setAuthenticator(new ExampleAuthenticator())
                .setAuthorizer(new ExampleAuthorizer())
                .setRealm("SUPER SECRET STUFF")
                .buildAuthFilter()));
        environment.jersey().register(new AuthValueFactoryProvider.Binder<>(User.class));
        environment.jersey().register(RolesAllowedDynamicFeature.class);

        environment.healthChecks().register("template", healthCheck);
        
        environment.jersey().register(temperatureResource);

    }

}
