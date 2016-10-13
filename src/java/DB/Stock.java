package DB;
// Generated Oct 14, 2016 12:43:12 AM by Hibernate Tools 3.6.0


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
     private Double price;
     private Double discount;
     private String date;
     private Integer status;
     private String targetpop;
     private String code;
     private String image;
     private String discription;
     private Set invoiceItemses = new HashSet(0);
     private Set sizes = new HashSet(0);
     private Set stockHasCarts = new HashSet(0);

    public Stock() {
    }

	
    public Stock(User user, Catagory catagory) {
        this.user = user;
        this.catagory = catagory;
    }
    public Stock(User user, Catagory catagory, String productName, Double price, Double discount, String date, Integer status, String targetpop, String code, String image, String discription, Set invoiceItemses, Set sizes, Set stockHasCarts) {
       this.user = user;
       this.catagory = catagory;
       this.productName = productName;
       this.price = price;
       this.discount = discount;
       this.date = date;
       this.status = status;
       this.targetpop = targetpop;
       this.code = code;
       this.image = image;
       this.discription = discription;
       this.invoiceItemses = invoiceItemses;
       this.sizes = sizes;
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
    public Double getPrice() {
        return this.price;
    }
    
    public void setPrice(Double price) {
        this.price = price;
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
    public String getTargetpop() {
        return this.targetpop;
    }
    
    public void setTargetpop(String targetpop) {
        this.targetpop = targetpop;
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
    public Set getSizes() {
        return this.sizes;
    }
    
    public void setSizes(Set sizes) {
        this.sizes = sizes;
    }
    public Set getStockHasCarts() {
        return this.stockHasCarts;
    }
    
    public void setStockHasCarts(Set stockHasCarts) {
        this.stockHasCarts = stockHasCarts;
    }




}


