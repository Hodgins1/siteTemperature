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
import com.fasterxml.jackson.annotation.JsonProperty;
import java.util.Objects;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;
import org.hibernate.validator.constraints.Length;

@Entity
@Table(name = "temperatures")
@NamedQueries({
        @NamedQuery(
                name = "semestralka.Temperature.findAll",
                query = "SELECT t from Temperature t"
        )
})
public class Temperature {

    @Id
    @GeneratedValue
    private long id;

    @Length(max = 100)
    private String temp_value;

    public Temperature() {
        // Jackson deserialization

    }

    public Temperature(String temp_value) {
        this.temp_value = temp_value;
    }

    public Temperature(long id, String temp_value) {
        this.id = id;
        this.temp_value = temp_value;
    }

    @JsonProperty
    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public void setContent(String temp_value) {
        this.temp_value = temp_value;
    }

    @JsonProperty
    public String getContent() {
        return temp_value;
    }

    @Override
    public int hashCode() {
        int hash = 5;
        hash = 59 * hash + (int) (this.id ^ (this.id >>> 32));
        hash = 59 * hash + Objects.hashCode(this.temp_value);
        return hash;
    }

    @Override
    public boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj == null) {
            return false;
        }
        if (getClass() != obj.getClass()) {
            return false;
        }
        final Temperature other = (Temperature) obj;
        if (this.id != other.id) {
            return false;
        }
        if (!Objects.equals(this.temp_value, other.temp_value)) {
            return false;
        }
        return true;
    }
}
