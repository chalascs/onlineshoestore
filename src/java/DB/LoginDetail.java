package DB;
// Generated Dec 21, 2016 2:58:47 AM by Hibernate Tools 3.6.0



/**
 * LoginDetail generated by hbm2java
 */
public class LoginDetail  implements java.io.Serializable {


     private Integer logid;
     private User user;
     private String intime;
     private String outtime;

    public LoginDetail() {
    }

	
    public LoginDetail(User user) {
        this.user = user;
    }
    public LoginDetail(User user, String intime, String outtime) {
       this.user = user;
       this.intime = intime;
       this.outtime = outtime;
    }
   
    public Integer getLogid() {
        return this.logid;
    }
    
    public void setLogid(Integer logid) {
        this.logid = logid;
    }
    public User getUser() {
        return this.user;
    }
    
    public void setUser(User user) {
        this.user = user;
    }
    public String getIntime() {
        return this.intime;
    }
    
    public void setIntime(String intime) {
        this.intime = intime;
    }
    public String getOuttime() {
        return this.outtime;
    }
    
    public void setOuttime(String outtime) {
        this.outtime = outtime;
    }




}


