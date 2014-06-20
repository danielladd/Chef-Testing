package app;

import com.google.common.collect.ImmutableMap;

import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;
import java.util.Map;
import java.util.Properties;

@Path("/")
@Produces(MediaType.APPLICATION_JSON)
public class RootResource {
    @GET
    @Produces(MediaType.TEXT_HTML)
    public String index() {
        return "<html><body><ul>"
                + "<li><a href=\"systemProperties\">systemProperties</a></li>"
                + "<li><a href=\"environment\">environment</a></li>"
                + "<li><a href=\"memory\">memory</a></li>"
                + "</ul></body></html>";
    }

    @Path("/systemProperties")
    @GET
    public Properties systemProperties() {
        return System.getProperties();
    }

    @Path("/environment")
    @GET
    public Map<String, String> environment() {
        return System.getenv();
    }

    @Path("/memory")
    @GET
    public Map<String, Object> memory() {
        Runtime runtime = Runtime.getRuntime();
        return ImmutableMap.<String, Object>builder()
                .put("freeMemory", runtime.freeMemory())
                .put("maxMemory", runtime.maxMemory())
                .put("totalMemory", runtime.totalMemory())
                .build();
    }
}
