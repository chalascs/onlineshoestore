package DB;
// Generated Oct 14, 2016 12:43:12 AM by Hibernate Tools 3.6.0


import java.util.HashSet;
import java.util.Set;

/**
 * Invoice generated by hbm2java
 */
public class Invoice  implements java.io.Serializable {


     private Integer invoiceId;
     private Integer totalPrice;
     private Set invoiceItemses = new HashSet(0);

    public Invoice() {
    }

    public Invoice(Integer totalPrice, Set invoiceItemses) {
       this.totalPrice = totalPrice;
       this.invoiceItemses = invoiceItemses;
    }
   
    public Integer getInvoiceId() {
        return this.invoiceId;
    }
    
    public void setInvoiceId(Integer invoiceId) {
        this.invoiceId = invoiceId;
    }
    public Integer getTotalPrice() {
        return this.totalPrice;
    }
    
    public void setTotalPrice(Integer totalPrice) {
        this.totalPrice = totalPrice;
    }
    public Set getInvoiceItemses() {
        return this.invoiceItemses;
    }
    
    public void setInvoiceItemses(Set invoiceItemses) {
        this.invoiceItemses = invoiceItemses;
    }




}


