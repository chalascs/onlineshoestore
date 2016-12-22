<%-- 
    Document   : checkout
    Created on : Oct 19, 2016, 9:21:58 PM
    Author     : Shanaka
--%>

<%@page import="java.util.Date"%>
<%@page import="DB.InvoiceItems"%>
<%@page import="org.hibernate.criterion.Order"%>
<%@page import="java.util.HashMap"%>
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
                var size = document.getElementById("size");
                alert(size);
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

            function login() {
                var Type = "Login";
                var logfrom = "checkout";
                var uname = document.getElementById("username").value;
                var pass = document.getElementById("password").value;

                var xhttp = new XMLHttpRequest();
                xhttp.onreadystatechange = function() {
                    if (xhttp.readyState === 4 && xhttp.status === 200) {

                    }
                };
                xhttp.open("GET", "login?logfrom=" + logfrom + "&uname=" + uname + "&pass=" + pass + "&type=" + Type, true);
                xhttp.send();
            }

            function confirm() {

//                var Type = "confirm";
//                var size = document.getElementById("ssize").innerHTML;
//                var stid = document.getElementById("pid").value;
//                var qty = document.getElementById("abc").value;

                var xhttp = new XMLHttpRequest();
                xhttp.onreadystatechange = function() {
                    if (xhttp.readyState === 4 && xhttp.status === 200) {

                    }
                };

//                xhttp.open("GET", "checkout?Type" + Type + "&size=" + size + "&stid=" + stid + "&qty=" + qty, true);

                xhttp.open("GET", "checkout", true);
                xhttp.send();
            }


            function purchaseone() {

                var xhttp = new XMLHttpRequest();
                xhttp.onreadystatechange = function() {
                    if (xhttp.readyState === 4 && xhttp.status === 200) {

                    }
                };

            }
            function home(){
                window.location.href="index.jsp";
            }

        </script>
    </head>
    <body id="background">
        <%
            if (request.getSession().getAttribute("cart") == null) {
                response.sendRedirect("browseProducts.jsp?map=all");
            }
            if(request.getSession().getAttribute("user") == null){
                response.sendRedirect("login.jsp");
            }else{
        %>
        <div class="row">
            <div class="col-md-1"></div>
            <div class="col-md-10">
                <div class="row">
                    <div class="col-md-4"></div>
                    <div class="col-md-4" style="margin-top: 0px;">
                        <a href="index.jsp"><img src="img/logo.png" class="img-responsive"  style="text-align: center"></a>
                    </div>
                    <div class="col-md-4"></div>
                </div>
                <div class="row">
                    <div class="col-md-12">
                        <h3 style="font-weight: bold; font-family: sans-serif; text-align: center; color: white; margin-top: 0px;" class="text-center"><span class="glyphicon glyphicon-shopping-cart"></span>Checkout</h3>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-12 crt" id="carttable">
                        <table style="background-color: white" class="table table-responsive table-condensed " id="table-cart">
                            <thead style="border: 1px solid #eeee" class="">
                                <tr class="active">
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
                                    <!--                                    <div class="col-md-2" style="margin-top: 70px;">
                                                                            <input type="button" class="btn btn-danger btn-xs" value="X" onclick="remove('<%=st.indexOf(stk)%>')">
                                                                        </div>-->
                                    <div class="col-md-10">
                                        <img src="<%=stk.getImage()%>" style="width: 150px; height: 120px;">                                        
                                    </div>

                                <td class="text-right"><%=stk.getProductName()%><input type="hidden" id="proID<%=ii%>" value="<%=stk.getStid()%>"><input type="hidden" id="pid" value="<%=stk.getStid()%>"></td>
                                <td class="text-right"><%=stk.getPrice()%><input type="hidden" id="cartPrice<%=ii%>" value="<%=stk.getPrice()%>"></td>
                                    <%
                                        Session ses = NewHibernateUtil.getSessionFactory().openSession();
                                        Criteria cr = ses.createCriteria(DB.Size.class);
                                        cr.add(Restrictions.eq("stock", stk));
                                    %>
                                <td class="text-right" id="ssize">

                                    <%
                                        if (request.getSession().getAttribute("selectedsize") != null) {
                                            HashMap hm = (HashMap) request.getSession().getAttribute("selectedsize");
                                    %>

                                    <%=hm.get(stk.getStid().toString())%>

                                    <%}%>

                                </td>
                                <td class="text-right">
                                    <div class="row">
                                        <div class="col-md-12">
                                            <%
                                                if (request.getSession().getAttribute("selectedqty") != null) {
                                                    HashMap hm = (HashMap) request.getSession().getAttribute("selectedqty");

                                            %>
                                            <%=hm.get(stk.getStid().toString())%>

                                            <%}%>
                                        </div>
                                        <div class="col-md-12" style="margin-top: 10px;">
                                            <a onclick="remove('<%=st.indexOf(stk)%>')" class="btn btn-xs btn-danger" style="cursor: pointer">Remove</a>
                                        </div>
                                    </div>
                                </td>
                                <td id="cartTortel<%=ii%>" class="text-right"><%=stk.getPrice()%>
                                    <div class="col-md-12" style="margin-top: 10px;">
                                        <a onclick="purchaseone()" class="btn btn-xs btn-primary" style="cursor: pointer">Confirm this</a>
                                    </div>
                                </td>
                            </tr>
                            <%}
                                }%>
                        </table>

                    </div>
                </div>
                <hr>
                <div class="row">
                    <div class="col-md-3 form" style="border-right: 1px solid #eee">
                        <div class="row text-center">
                            <h4>Personal Details</h4>
                        </div>
                        <%
                            if (request.getSession().getAttribute("user") == null) {
                        %>
                        <div class="row">
                            <div class="col-md-6">
                                <input type="text" placeholder="User Name" class="form-control" name="uname" id="username"/>
                            </div>
                            <div class="col-md-6">                                 
                                <input type="password" placeholder="Password" class="form-control" name="pass" id="password"/>
                            </div>
                            <div class="col-md-12 text-center" style="margin-top: 10px;"><button class="btn btn-sm btn-primary" onclick="login()">Login</button></div>
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

                    <div class="col-md-5 text-center panel-default" style="border-right: 1px solid #eee; margin-top: 0px;">

                        <div class="row">
                            <div class="row">

                                <h4>Payment Method</h4>
                            </div>

                        </div>
                        <div class="row">
                            <center><img src="img/cards.png" class="img-responsive" style="width: 400px;height: 30px;"></center>
                        </div>

                    </div>
                    <!--<div class="col-md-3 text-center" style="">-->
<!--                        <div class="row">
                            <h4>Totals</h4>
                        </div>-->
<!--                        <div class="row">
                            <div class="col-md-6"><h6>Sub-Total</h6></div>
                            <div class="col-md-6"><h6></h6></div>
                        </div>
                        <div class="row">
                            <div class="col-md-6"><h6>Total</h6></div>
                            <div class="col-md-6"></div>-->
<!--                        </div>
                        <div class="row">-->
<!--                            <table>
                                <tr>
                                    <td><input type="checkbox" class="form-control"/></td>
                                    <td  style="margin-top: 5px;"><h6 style="margin-left: 10px;">I have read and agree to the <a href="">Terms & Conditions</a></h6></td>
                                </tr>
                            </table>-->
<!--                        </div>-->
                        <div class="row">
                            <div class="col-md-12 text-right" style="margin-top: 10px;">
                                <button class="btn cnfrm" style="background-color: #73a839; color: white;" onclick="confirm()" data-toggle="modal" data-target="#myModal" >Confirm</button> 
                            </div>
                        </div>
                    </div>
                </div> 
                <!-- Modal -->
                <div class="modal fade" id="myModal" role="dialog">
                    <div class="modal-dialog">
                        <%
                            DB.User us =(User) request.getSession().getAttribute("user");
                        %>
                        <!-- Modal content-->
                        <div class="modal-content" style="background-color: #eeee;">
                            <div class="modal-header">
                                <center><h3 class="text-success">Invoice</h3></center>
                                <!--                                <button type="button" class="close" data-dismiss="modal">&times;</button>-->
                                <h4 class="modal-title"></h4>
                            </div>
                            <div class="modal-body">
                                <div class="row">
                                    <div class="col-md-6" >
                                        <div class="row" style="color: royalblue">
                                            <div class="col-md-12"><h4 style="color: #101010; font-weight: bold">DATE</h4></div>
                                        </div>
                                        <div class="row">
                                            <div class="col-md-12"><h5><%=new Date()%></h5></div>
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="row">
                                            <div class="col-md-12 text-center"><h4 style="color: #101010; font-weight: bold">BILL TO</h4></div>
                                            <div class="col-md-12 text-center text-primary"><%=us.getFname()%> <%=us.getLname()%> </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-12">

                                        <table class="table table-bordered table-hover table-striped">
                                            <thead>
                                                <tr>
                                                    <td>Product</td>
                                                    <td>Qty</td>
                                                    <td>Price</td>
                                                    <td>Total</td>
                                                </tr>
                                            </thead>
                                            <%
                                                ArrayList<DB.Stock> st = (ArrayList<DB.Stock>) request.getSession().getAttribute("cart");
                                                HashMap hm = (HashMap)request.getSession().getAttribute("selectedqty");
                                                int tot = 0;
                                                for (DB.Stock stk : st) {
                                            %>
                                            <tr>
                                                <td><%=stk.getProductName() %></td>
                                                <td><%=hm.get(stk.getStid().toString()) %></td>
                                                <td><%=stk.getPrice() %></td>
                                                <td><%=Integer.parseInt((String)hm.get(stk.getStid().toString())) * stk.getPrice() %></td>
                                                <%
                                                tot +=  Integer.parseInt((String)hm.get(stk.getStid().toString())) * stk.getPrice();
                                                %>
                                            </tr>
                                            <%}%>
                                        </table>
                                        <div class="row">
                                            <div class="col-md-6"><h3 style="color: #1EAEDB">Thank you..</h3></div>
                                            <div class="col-md-6">
                                                <div class="col-md-6"><h4 style="color: turquoise">Total :</h4></div>
                                                <div class="col-md-6"><h4 style="color: tomato">Rs.<%=tot%></h4></div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-default" data-dismiss="modal">Shop More</button>
                                <button type="button" class="btn btn-default" data-dismiss="modal" onclick="home()">Close</button>
                            </div>
                        </div>

                    </div>
                    
                </div>
            </div>
            <div class="col-md-1"></div>
        </div>
                                            <%}%>
    </body>
</html>
