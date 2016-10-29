<%-- 
    Document   : cart
    Created on : Oct 14, 2016, 4:51:33 PM
    Author     : Shanaka
--%>

<%@page import="DB.Size"%>
<%@page import="org.hibernate.criterion.Restrictions"%>
<%@page import="connection.NewHibernateUtil"%>
<%@page import="DB.Stock"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Shopping Cart - ShoeMart</title>
        <link rel="stylesheet" href="css/bootstrap.min_1.css">
        <link rel="stylesheet" href="css/custom.css">
        <link rel="stylesheet" href="css/font-awesome.min.css">
        <script src="js/jquery-3.1.0.min.js" type="text/javascript"></script>
        <script src="js/jquery.form.js" type="text/javascript"></script>
        <script src="js/progressBarScript.js" type="text/javascript"></script>
        <script src="js/bootstrap.min.js"></script>
        <style>
            p{
                font-size: 12px;
            }
            .topbar li {
                color: white;
            }
            .topbar li a{
                color: white;
            }
        </style>
        <script>
            function changeQTY(ab) {

                var xhttp = new XMLHttpRequest();
                var ss = ab.split("-");
                var cartPrice = document.getElementById("cartPrice" + ss[1]).value;
                var size = document.getElementById("size" + ss[1]).value;
                var proID = document.getElementById("proID" + ss[1]).value;
                var qty = ss[0];

                var Type = "changeQTY";
                xhttp.onreadystatechange = function() {
                    if (xhttp.readyState === 4 && xhttp.status === 200) {

                        var resValue = xhttp.responseText.split("-");
                        if (resValue[0] === "Total") {

                            document.getElementById("cartTortel" + ss[1]).innerHTML = resValue[1];
                            document.getElementById("hederCartButton").innerHTML = resValue[2];
                        } else if (resValue[0] === "Message") {
                            alert(resValue[1]);
                        }
                    }
                };
                xhttp.open("GET", "cart?cartPrice=" + cartPrice + "&size=" + size + "&qty=" + qty + "&Type=" + Type + "&proID=" + proID, true);
                xhttp.send();
            }

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
        <div class="row container-fluid" id="fullpage">
            <div class="col-md-1"></div>
            <div class="col-md-10">
                <%@include file="header.jsp" %>
                <div class="row">
                    <div class="col-md-12 text-center"><h2 style="color: white"><span class="fa fa-shopping-cart"></span> Shopping Cart</h2></div>
                </div>
                <div class="row" style="margin-top: 20px;">
                    <div class="col-md-12 text-center" id="carttable">
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
                                ArrayList<DB.Stock> st = (ArrayList<Stock>) request.getSession().getAttribute("cart");
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
                                        <%                                            List<Size> si = (List<Size>) cr.list();
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
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-6"></div>
                    <div class="col-md-6 text-right" style="margin-bottom: 30px;"><a class="btn btn-primary btn-sm" href="checkout.jsp">Checkout</a></div>
                </div>
                <div class="row">
                    <div class="col-md-3 text-center">
                        <i class="fa fa-lock fa-3x"></i>
                        <h5>Secure Site</h5>
                        <p>1st web site in Sri Lanka to implement Extended Validation SSL certificates to have the physical existence verified.</p>
                    </div>
                    <div class="col-md-3 text-center">
                        <i class="fa fa-truck fa-3x"></i>
                        <h5>Island wide Delivery</h5>
                        <P>We ship to all districts in Sri Lanka. North to South or East to West,
                            <br>
                            you name it..
                        </P>                   
                    </div>
                    <div class="col-md-3 text-center">
                        <i class="fa fa-credit-card fa-3x"></i>
                        <h5>Multiple Payment Options</h5>
                        <p>Pay with Sri Lanka’s most popular and secure payment methods - Credit cards, mobile payments to loyalty points.</p>

                    </div>
                    <div class="col-md-3 text-center">
                        <i class="fa fa-clock-o fa-3x"></i>
                        <h5>Office Hours</h5>
                        <p>Our processing office is open from 9:30am - 5:30pm on Weekdays plus 9:30am - 5pm on Saturdays.</p>

                    </div>
                </div>
            </div>
            <div class="col-md-1"></div>
            <div class="row"> 
                <div class="col-md-12">
                    <%@include file="footer.jsp" %>                   
                </div>
            </div>
        </div>
    </body>
</html>
