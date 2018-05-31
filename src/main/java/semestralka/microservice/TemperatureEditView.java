/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package semestralka.microservice;

import io.dropwizard.views.View;

/**
 *
 * @author Robert Sochuliak
 */
public class TemperatureEditView extends View {

    private final Temperature temperature;



    public Temperature getTemperature() {
        return temperature;
    }



    public TemperatureEditView(Temperature temperature) {
        super("temperatureEditView.ftl");
        this.temperature = temperature;
    }

    

}
