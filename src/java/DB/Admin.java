package DB;
// Generated Dec 21, 2016 2:58:47 AM by Hibernate Tools 3.6.0



/**
 * Admin generated by hbm2java
 */
public class Admin  implements java.io.Serializable {


     private Integer adminid;
     private String uname;
     private String pass;

    public Admin() {
    }

    public Admin(String uname, String pass) {
       this.uname = uname;
       this.pass = pass;
    }
   
    public Integer getAdminid() {
        return this.adminid;
    }
    
    public void setAdminid(Integer adminid) {
        this.adminid = adminid;
    }
    public String getUname() {
        return this.uname;
    }
    
    public void setUname(String uname) {
        this.uname = uname;
    }
    public String getPass() {
        return this.pass;
    }
    
    public void setPass(String pass) {
        this.pass = pass;
    }




}


