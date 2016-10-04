package DB;
// Generated Oct 5, 2016 1:19:24 AM by Hibernate Tools 3.6.0



/**
 * Login generated by hbm2java
 */
public class Login  implements java.io.Serializable {


     private Integer logid;
     private User user;
     private String email;
     private String password;

    public Login() {
    }

	
    public Login(User user) {
        this.user = user;
    }
    public Login(User user, String email, String password) {
       this.user = user;
       this.email = email;
       this.password = password;
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
    public String getEmail() {
        return this.email;
    }
    
    public void setEmail(String email) {
        this.email = email;
    }
    public String getPassword() {
        return this.password;
    }
    
    public void setPassword(String password) {
        this.password = password;
    }




}


