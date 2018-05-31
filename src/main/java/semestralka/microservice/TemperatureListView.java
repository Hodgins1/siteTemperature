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
public class TemperatureListView extends View{

    private List<Temperature> temperatures;

    public List<Temperature> getTemperatures() {
        return temperatures;
    }

//    public void setTemperatures(List<Temperature> temperatures) {
//        this.temperatures = temperatures;
//    }

    
    public TemperatureListView(List<Temperature> temperatures) {
        super("temperatureListView.ftl");
        this.temperatures = temperatures;
    }
    
    
    
}
