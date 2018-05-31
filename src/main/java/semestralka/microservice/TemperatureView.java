/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package semestralka.microservice;

import io.dropwizard.views.View;

import java.util.List;

/**
 *
 * @author Robert Sochuliak
 */
public class TemperatureView extends View {

//    private final Temperature temperature;
    private List<Temperature> temperatures;

    public List<Temperature> getTemperatures() {
        return temperatures;
    }



//    public TemperatureView(Temperature temperature) {
//        super("temperatureListView.ftl");
//        this.temperature = temperatures;
//    }

    public TemperatureView(List<Temperature> temperatures) {
        super("temperatureListView.ftl");
        this.temperatures = temperatures;
    }




}
