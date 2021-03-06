package DB;
// Generated Dec 21, 2016 2:58:47 AM by Hibernate Tools 3.6.0


import java.util.HashSet;
import java.util.Set;

/**
 * District generated by hbm2java
 */
public class District  implements java.io.Serializable {


     private Integer iddistrict;
     private Province province;
     private String district;
     private Set cities = new HashSet(0);
     private Set addresses = new HashSet(0);

    public District() {
    }

	
    public District(Province province) {
        this.province = province;
    }
    public District(Province province, String district, Set cities, Set addresses) {
       this.province = province;
       this.district = district;
       this.cities = cities;
       this.addresses = addresses;
    }
   
    public Integer getIddistrict() {
        return this.iddistrict;
    }
    
    public void setIddistrict(Integer iddistrict) {
        this.iddistrict = iddistrict;
    }
    public Province getProvince() {
        return this.province;
    }
    
    public void setProvince(Province province) {
        this.province = province;
    }
    public String getDistrict() {
        return this.district;
    }
    
    public void setDistrict(String district) {
        this.district = district;
    }
    public Set getCities() {
        return this.cities;
    }
    
    public void setCities(Set cities) {
        this.cities = cities;
    }
    public Set getAddresses() {
        return this.addresses;
    }
    
    public void setAddresses(Set addresses) {
        this.addresses = addresses;
    }




}


