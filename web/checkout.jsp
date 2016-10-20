<%-- 
    Document   : checkout
    Created on : Oct 19, 2016, 9:21:58 PM
    Author     : Shanaka
--%>

<%@page import="DB.Size"%>
<%@page import="java.util.List"%>
<%@page import="org.hibernate.criterion.Restrictions"%>
<%@page import="org.hibernate.Criteria"%>
<%@page import="connection.NewHibernateUtil"%>
<%@page import="org.hibernate.Session"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Checkout-ShoeMart</title>
        <link rel="stylesheet" href="css/bootstrap.min_1.css">
        <link rel="stylesheet" href="css/custom.css">
        <link rel="stylesheet" href="css/font-awesome.min.css">
        <script src="js/jquery-3.1.0.min.js" type="text/javascript"></script>
        <script src="js/jquery.form.js" type="text/javascript"></script>
        <script src="js/progressBarScript.js" type="text/javascript"></script>
        <script src="js/bootstrap.min.js"></script>
        <script>
            
            function remove(rem) {

                var xhttp = new XMLHttpRequest();
                xhttp.onreadystatechange = function() {
                    if (xhttp.readyState === 4 && xhttp.status === 200) {
                        document.getElementById("carttable").innerHTML = xhttp.responseText;
                    }
                };
                xhttp.open("GET", "cart?remove=" + rem + "&Type=removeItem", true)
                xhttp.send();
            }
        </script>
    </head>
    <body id="background">
        <div class="row">
            <div class="col-md-1"></div>
            <div class="col-md-10">
                <div class="row">
                    <div class="col-md-4"></div>
                    <div class="col-md-4" style="margin-top: 20px;">
                        <a href="index.jsp"><img src="img/logo.png" class="img-responsive"  style="text-align: center"></a>
                    </div>
                    <div class="col-md-4"></div>
                </div>
                <div class="row">
                    <div class="col-md-12">
                        <h3 style="font-weight: bold; font-family: sans-serif; text-align: center" class="text-center"><span class="glyphicon glyphicon-shopping-cart"></span>Checkout</h3>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-12" id="carttable">
                        <table class="table table-responsive table-condensed" id="table-cart">
                            <thead style="border: 1px solid #eeee">
                                <tr>
                                    <th colspan="2">Product</th>
                                    <th class="text-right">Price</th>
                                    <th class="text-right">Size</th>  
                                    <th class="text-right">Qty</th>
                                    <th class="text-right">Total</th>  
                                </tr>
                            </thead>
                            <%
                                if (request.getSession().getAttribute("cart") == null) {
                            %>
                            <tr>
                                <td class="text-center" colspan="6" style="font-family:Helvetica,Arial,sans-serif; font-weight: bold;"><h4>Your cart is empty.. But it doesn't have to be</h4>
                                    <p>There are lots of great deals and one-of-a-kind items just waiting for you.
                                        Start shopping, and look for the "Buy Now" button. You can add several items to your cart from different sellers and pay for them all at once.
                                    </p>
                                    <br>
                                    <a href="http://localhost:8080/OnlineShoeStore/browseProducts.jsp?map=all">Start shopping and search for great deals</a>
                                </td> 
                            </tr>
                            <%} else {
                                ArrayList<DB.Stock> st = (ArrayList<DB.Stock>) request.getSession().getAttribute("cart");
                                int ii = 0;
                                for (DB.Stock stk : st) {
                                    ii++;

                            %>
                            <tr id="qwe">
                                <td class="text-center">
                                    <div class="col-md-2" style="margin-top: 70px;">
                                        <input type="button" class="btn btn-danger btn-xs" value="X" onclick="remove('<%=st.indexOf(stk)%>')">
                                    </div>
                                    <div class="col-md-10">
                                        <img src="<%=stk.getImage()%>" style="width: 200px; height: 170px;">                                        
                                    </div>

                                <td class="text-right"><%=stk.getProductName()%><input type="hidden" id="proID<%=ii%>" value="<%=stk.getStid()%>"></td>
                                <td class="text-right"><%=stk.getPrice()%><input type="hidden" id="cartPrice<%=ii%>" value="<%=stk.getPrice()%>"></td>
                                    <%
                                        Session ses = NewHibernateUtil.getSessionFactory().openSession();
                                        Criteria cr = ses.createCriteria(DB.Size.class);
                                        cr.add(Restrictions.eq("stock", stk));
                                    %>
                                <td class="text-right">
                                    <select id="size<%=ii%>" class="">
                                        <% List<Size> si = (List<Size>) cr.list();
                                            for (DB.Size sz : si) {
                                        %>
                                        <option><%=sz.getSize()%></option>
                                        <%}%>
                                    </select>
                                </td>
                                <td class="text-right"><input type="number" id="abc" onchange="changeQTY(this.value + '-<%=ii%>')" value="1"></td>
                                <td id="cartTortel<%=ii%>" class="text-right"><%=stk.getPrice()%></td>
                            </tr>
                            <%}
                                }%>
                        </table>
                        </table>
                    </div>
                </div>
            </div>
            <div class="col-md-1"></div>
        </div>
    </body>
</html>
