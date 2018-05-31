/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package semestralka.microservice;

import io.dropwizard.hibernate.UnitOfWork;
import io.dropwizard.jersey.params.LongParam;
import io.dropwizard.views.View;

import java.nio.charset.StandardCharsets;
import java.util.List;
import java.util.Optional;
import javax.annotation.security.RolesAllowed;
import javax.ws.rs.Consumes;
import javax.ws.rs.DELETE;
import javax.ws.rs.FormParam;
import javax.ws.rs.GET;
import javax.ws.rs.POST;
import javax.ws.rs.Path;
import javax.ws.rs.PathParam;
import javax.ws.rs.Produces;
import javax.ws.rs.WebApplicationException;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.Response;

/**
 *
 * @author Robert Sochuliak
 */





@Path("/temp")
//@RolesAllowed("BASIC_USER")
public class TemperatureResource {

    private final TemperatureDAO temperatureDAO;

    public TemperatureResource(TemperatureDAO temperature) { this.temperatureDAO = temperature; }

    @GET
    @Produces(MediaType.TEXT_HTML)
    @UnitOfWork
    public TemperatureListView viewFirst() {
        return new TemperatureListView(temperatureDAO.findAll()) {
        };
    }


//    @GET
//    @Path("/{id}")
//    @Produces(MediaType.TEXT_HTML)
//    @UnitOfWork
//    public TemperatureView getSaying(@PathParam("id") LongParam id) {
//        Optional<Temperature> result = temperatureDAO.findById(id.get());
//
//        if (result.isPresent()) {
//            return new TemperatureView(result.get());
//        }
//
//        throw new WebApplicationException(Response.status(Response.Status.NOT_FOUND).build());
//    }

    //


    @GET
//    @RolesAllowed("ADMIN")
    @Path("/chart")
    @Produces(MediaType.TEXT_HTML)
    @UnitOfWork
    public TemperatureChartView getChart() {

        return new TemperatureChartView(temperatureDAO.findAll());
    }



    @GET
    @Path("/edit/{id}")
    @Produces(MediaType.TEXT_HTML)
    @UnitOfWork
    public TemperatureEditView getEditForm(@PathParam("id") LongParam id) {
        Optional<Temperature> result = temperatureDAO.findById(id.get());

        if (result.isPresent()) {
            return new TemperatureEditView(result.get());
        }
        throw new WebApplicationException(Response.status(Response.Status.NOT_FOUND).build());
    }

    @GET
    @Path("/add")
    @Produces(MediaType.TEXT_HTML)
    @UnitOfWork
    public View getAddForm() {
        return new View("temperatureListView.ftl", StandardCharsets.UTF_8) {
        };
    }


    @POST
    @Path("/edit")
    @Produces(MediaType.TEXT_HTML)
    @Consumes(MediaType.APPLICATION_FORM_URLENCODED)
    @UnitOfWork
    public TemperatureListView editTemperature(@FormParam("id") String _id, @FormParam("content") String temp_value /* Saying saying*/) {
        Optional<Temperature> result = temperatureDAO.findById(Long.parseLong(_id));
        result.get().setContent(temp_value);
        return new TemperatureListView(temperatureDAO.findAll());
//        if (result.isPresent()) {
//            result.get().setContent(temp_value);
//            return new TemperatureView(result.get());
//        } else {
//            Temperature create = temperatureDAO.create(new Temperature(temp_value));
//            return new TemperatureView(create);
//        }
    }


    @POST
    @Produces(MediaType.APPLICATION_JSON)
    @UnitOfWork
    public Temperature createTemperature(Temperature temperature) {
        return temperatureDAO.create(temperature);
    }

    @GET
    @Path("/delete/{id}")
    @Produces(MediaType.TEXT_HTML)
    @UnitOfWork
    public TemperatureListView deleteTemperature(@PathParam("id") LongParam id) {
        Optional<Temperature> result = temperatureDAO.findById(id.get());
        if (result.isPresent()) {
            temperatureDAO.delete(result.get());
            return new TemperatureListView(temperatureDAO.findAll());
        }
        throw new WebApplicationException(Response.status(Response.Status.NOT_FOUND).build());
    }
    
    @DELETE
    @RolesAllowed("ADMIN")
    @Path("/{id}")
    @Produces(MediaType.APPLICATION_JSON)
    @UnitOfWork
    public Temperature deleteTemperature2(@PathParam("id") LongParam id) {
        Optional<Temperature> result = temperatureDAO.findById(id.get());
        if (result.isPresent()) {
            temperatureDAO.delete(result.get());
            return result.get();
        }
        throw new WebApplicationException(Response.status(Response.Status.NOT_FOUND).build());
    }

    @GET
//    @RolesAllowed("ADMIN")
    @Path("/list")
    @Produces(MediaType.TEXT_HTML)
    @UnitOfWork
    public TemperatureListView getTemperature() {

        return new TemperatureListView(temperatureDAO.findAll());
    }

//    @GET
////    @RolesAllowed("ADMIN")
//    @Path("/chart")
//    @Produces(MediaType.TEXT_HTML)
//    @UnitOfWork
//    public TemperatureChartView getSaying() {
//
//        return new TemperatureChartView(temperatureDAO.findAll());
//    }
//

    @GET
    @Produces(MediaType.APPLICATION_JSON)
    @UnitOfWork
    public List<Temperature> listTemperature() {

        return temperatureDAO.findAll();
    }

    @GET
    @Path("/data/{value}")
    @Produces(MediaType.APPLICATION_JSON)
    @UnitOfWork
    public String addTemperature(@PathParam("value") LongParam value) {
        String valueS = ""+value.get();
        Temperature create = temperatureDAO.create(new Temperature(valueS));
         return ""+value.get();
    }
}

