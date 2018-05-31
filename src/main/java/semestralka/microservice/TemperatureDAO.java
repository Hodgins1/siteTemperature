/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package semestralka.microservice;

import io.dropwizard.hibernate.AbstractDAO;
import java.util.List;
import java.util.Optional;
import javax.ws.rs.WebApplicationException;
import javax.ws.rs.core.Response;
import org.hibernate.SessionFactory;

/**
 *
 * @author Robert Sochuliak
 */
public class TemperatureDAO extends AbstractDAO<Temperature> {

    public TemperatureDAO(SessionFactory sessionFactory) {
        super(sessionFactory);
    }

    public void delete(Temperature temperature){
        currentSession().delete(temperature);
    }

    public Optional<Temperature> findById(Long id) {
        if (id != null) {
            return Optional.ofNullable(get(id));
        }
        throw new WebApplicationException(Response.status(Response.Status.NOT_FOUND).build());
    }

    public Temperature create(Temperature person) { return persist(person); }

    public List<Temperature> findAll() {
        return list(namedQuery("semestralka.Temperature.findAll"));
    }

}
