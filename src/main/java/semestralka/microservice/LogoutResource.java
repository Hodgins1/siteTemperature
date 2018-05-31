package semestralka.microservice;

import io.dropwizard.hibernate.UnitOfWork;
import io.dropwizard.jersey.params.LongParam;
import io.dropwizard.views.View;
import org.dhatim.dropwizard.jwt.cookie.authentication.JwtCookiePrincipal;

import java.nio.charset.StandardCharsets;
import java.util.List;
import java.util.Optional;
import javax.annotation.security.RolesAllowed;
import javax.servlet.http.HttpServletRequest;
import javax.ws.rs.Consumes;
import javax.ws.rs.DELETE;
import javax.ws.rs.FormParam;
import javax.ws.rs.GET;
import javax.ws.rs.POST;
import javax.ws.rs.Path;
import javax.ws.rs.PathParam;
import javax.ws.rs.Produces;
import javax.ws.rs.WebApplicationException;
import javax.ws.rs.container.ContainerRequestContext;
import javax.ws.rs.core.Context;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.Response;

@Path("/logout")
public class LogoutResource {
    @Path("/logout")
    @GET
    public String logout(@Context HttpServletRequest req) {

        req.getSession().invalidate();
        return "You have been logged out.";
    }
}