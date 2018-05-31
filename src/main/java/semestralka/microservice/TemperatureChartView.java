package semestralka.microservice;
import io.dropwizard.views.View;
import java.util.List;

public class TemperatureChartView extends View{

    private List<Temperature> temperatures;

    public List<Temperature> getTemperatures() {
        return temperatures;
    }

    public TemperatureChartView(List<Temperature> temperatures) {
        super("temperatureChartView.ftl");
        this.temperatures = temperatures;
    }
}
