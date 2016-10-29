package DB;
// Generated Oct 28, 2016 1:45:07 PM by Hibernate Tools 3.6.0



/**
 * InvoiceItems generated by hbm2java
 */
public class InvoiceItems  implements java.io.Serializable {


     private int invItemsId;
     private Stock stock;
     private Invoice invoice;

    public InvoiceItems() {
    }

	
    public InvoiceItems(int invItemsId) {
        this.invItemsId = invItemsId;
    }
    public InvoiceItems(int invItemsId, Stock stock, Invoice invoice) {
       this.invItemsId = invItemsId;
       this.stock = stock;
       this.invoice = invoice;
    }
   
    public int getInvItemsId() {
        return this.invItemsId;
    }
    
    public void setInvItemsId(int invItemsId) {
        this.invItemsId = invItemsId;
    }
    public Stock getStock() {
        return this.stock;
    }
    
    public void setStock(Stock stock) {
        this.stock = stock;
    }
    public Invoice getInvoice() {
        return this.invoice;
    }
    
    public void setInvoice(Invoice invoice) {
        this.invoice = invoice;
    }




}


