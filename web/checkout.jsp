<%-- 
    Document   : checkout
    Created on : Oct 19, 2016, 9:21:58 PM
    Author     : Shanaka
--%>

<%@page import="DB.User"%>
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
                xhttp.open("GET", "cart?remove=" + rem + "&Type=removeItem", true);
                xhttp.send();
            }
        </script>
    </head>
    <body id="background">
        <%
            if(request.getSession().getAttribute("cart")== null){
             response.sendRedirect("browseProducts.jsp?map=all");
            }
        %>
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

                    </div>
                </div>
                <div class="row">
                    <div class="col-md-3 form" style="border: 1px solid #eee; margin: 8px;">
                        <div class="row text-center">
                            <h4>Personal Details</h4>
                        </div>
                        <%
                            if (request.getSession().getAttribute("user") == null) {
                        %>
                        <div class="row">
                            <div class="col-md-6">
                                <input type="text" placeholder="User Name" class="form-control" name="uname"/>
                            </div>
                            <div class="col-md-6">                                 
                                <input type="password" placeholder="Password" class="form-control" name="pass"/>
                            </div>
                        </div>
                        <%
                        } else {
                            DB.User us = (User) request.getSession().getAttribute("user");
                        %>
                        <div class="row">
                            <div class="col-md-12 text-center" style="color: #66ff00">

                                <h3>Hello <%=us.getFname()%> <%=us.getLname()%> <span class="fa fa-check-circle"></span></h3>
                            </div>
                        </div>
                        <%
                            }
                        %>
                    </div>

                    <div class="col-md-5 text-center panel-default" style="border: 1px solid #eee; margin: 8px;">
                       
                        <div class="row">
                            <div class="row">
                                
                            <h4>Payment Method</h4>
                            </div>
                            <hr>
                        </div>
                        <div class="row">
                            <h5>Card Installments</h5>
                            <div class="row ">
                            <input type="radio" name="pmethod" value="allcrard"/>
                            <label> Credit/Debit Card: Visa & MasterCard</label>
                            </div>
                            <div class="row">
                            <input type="radio" name="pmethod" value="amarican"/>
                            <label> Credit Card: American Express</label>
                            </div>
                        </div>
                        
                    </div>
                    <div class="col-md-3 text-center" style="border: 1px solid #eee; margin: 8px;">
                        <div class="row">
                            <h4>Totals</h4>
                        </div>
                        <div class="row">
                            <div class="col-md-6"><h6>Sub-Total</h6></div>
                            <div class="col-md-6"><h6></h6></div>
                        </div>
                        <div class="row">
                            <div class="col-md-6"><h6>Total</h6></div>
                            <div class="col-md-6"></div>
                        </div>
                        <div class="row">
                            <table>
                                <tr>
                                    <td><input type="checkbox" class="form-control"/></td>
                                    <td><label>I have read and agree to the <a href="">Terms & Conditions</a></label></td>
                                </tr>
                            </table>
                            
                            
                        </div>
                    </div>
                </div> 
            </div>
            <div class="col-md-1"></div>
        </div>
    </body>
</html>
