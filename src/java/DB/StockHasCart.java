package DB;
// Generated Dec 21, 2016 2:58:47 AM by Hibernate Tools 3.6.0



/**
 * StockHasCart generated by hbm2java
 */
public class StockHasCart  implements java.io.Serializable {


     private Integer idCart;
     private Stock stock;
     private Cart cart;

    public StockHasCart() {
    }

    public StockHasCart(Stock stock, Cart cart) {
       this.stock = stock;
       this.cart = cart;
    }
   
    public Integer getIdCart() {
        return this.idCart;
    }
    
    public void setIdCart(Integer idCart) {
        this.idCart = idCart;
    }
    public Stock getStock() {
        return this.stock;
    }
    
    public void setStock(Stock stock) {
        this.stock = stock;
    }
    public Cart getCart() {
        return this.cart;
    }
    
    public void setCart(Cart cart) {
        this.cart = cart;
    }




}


