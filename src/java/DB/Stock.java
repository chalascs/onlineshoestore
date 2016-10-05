package DB;
// Generated Oct 5, 2016 3:08:36 PM by Hibernate Tools 3.6.0


import java.util.HashSet;
import java.util.Set;

/**
 * Stock generated by hbm2java
 */
public class Stock  implements java.io.Serializable {


     private Integer stid;
     private User user;
     private Catagory catagory;
     private String productName;
     private Integer qty;
     private Double discount;
     private String date;
     private Integer status;
     private String code;
     private String image;
     private String discription;
     private Set invoiceItemses = new HashSet(0);
     private Set stockHasCarts = new HashSet(0);

    public Stock() {
    }

	
    public Stock(User user, Catagory catagory) {
        this.user = user;
        this.catagory = catagory;
    }
    public Stock(User user, Catagory catagory, String productName, Integer qty, Double discount, String date, Integer status, String code, String image, String discription, Set invoiceItemses, Set stockHasCarts) {
       this.user = user;
       this.catagory = catagory;
       this.productName = productName;
       this.qty = qty;
       this.discount = discount;
       this.date = date;
       this.status = status;
       this.code = code;
       this.image = image;
       this.discription = discription;
       this.invoiceItemses = invoiceItemses;
       this.stockHasCarts = stockHasCarts;
    }
   
    public Integer getStid() {
        return this.stid;
    }
    
    public void setStid(Integer stid) {
        this.stid = stid;
    }
    public User getUser() {
        return this.user;
    }
    
    public void setUser(User user) {
        this.user = user;
    }
    public Catagory getCatagory() {
        return this.catagory;
    }
    
    public void setCatagory(Catagory catagory) {
        this.catagory = catagory;
    }
    public String getProductName() {
        return this.productName;
    }
    
    public void setProductName(String productName) {
        this.productName = productName;
    }
    public Integer getQty() {
        return this.qty;
    }
    
    public void setQty(Integer qty) {
        this.qty = qty;
    }
    public Double getDiscount() {
        return this.discount;
    }
    
    public void setDiscount(Double discount) {
        this.discount = discount;
    }
    public String getDate() {
        return this.date;
    }
    
    public void setDate(String date) {
        this.date = date;
    }
    public Integer getStatus() {
        return this.status;
    }
    
    public void setStatus(Integer status) {
        this.status = status;
    }
    public String getCode() {
        return this.code;
    }
    
    public void setCode(String code) {
        this.code = code;
    }
    public String getImage() {
        return this.image;
    }
    
    public void setImage(String image) {
        this.image = image;
    }
    public String getDiscription() {
        return this.discription;
    }
    
    public void setDiscription(String discription) {
        this.discription = discription;
    }
    public Set getInvoiceItemses() {
        return this.invoiceItemses;
    }
    
    public void setInvoiceItemses(Set invoiceItemses) {
        this.invoiceItemses = invoiceItemses;
    }
    public Set getStockHasCarts() {
        return this.stockHasCarts;
    }
    
    public void setStockHasCarts(Set stockHasCarts) {
        this.stockHasCarts = stockHasCarts;
    }




}


