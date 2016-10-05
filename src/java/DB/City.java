package DB;
// Generated Oct 5, 2016 3:08:36 PM by Hibernate Tools 3.6.0


import java.util.HashSet;
import java.util.Set;

/**
 * City generated by hbm2java
 */
public class City  implements java.io.Serializable {


     private Integer cityid;
     private District district;
     private String cityname;
     private Set addresses = new HashSet(0);

    public City() {
    }

	
    public City(District district) {
        this.district = district;
    }
    public City(District district, String cityname, Set addresses) {
       this.district = district;
       this.cityname = cityname;
       this.addresses = addresses;
    }
   
    public Integer getCityid() {
        return this.cityid;
    }
    
    public void setCityid(Integer cityid) {
        this.cityid = cityid;
    }
    public District getDistrict() {
        return this.district;
    }
    
    public void setDistrict(District district) {
        this.district = district;
    }
    public String getCityname() {
        return this.cityname;
    }
    
    public void setCityname(String cityname) {
        this.cityname = cityname;
    }
    public Set getAddresses() {
        return this.addresses;
    }
    
    public void setAddresses(Set addresses) {
        this.addresses = addresses;
    }




}

