<%-- 
    Document   : header
    Created on : Sep 22, 2016, 11:16:51 PM
    Author     : Shanaka
--%>

<%@page import="DB.UserType"%>
<%@page import="java.util.List"%>
<%@page import="org.hibernate.Criteria"%>
<%@page import="org.hibernate.Session"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        
        <link rel="stylesheet" href="css/bootstrap.min.css">
        <link rel="stylesheet" href="css/custom.css">
        <link rel="stylesheet" href="css/font-awesome.min.css">
        <script src="js/jquery-3.1.0.min.js"></script>       
        <script src="js/bootstrap.min.js"></script> 
        <script type="text/javascript">
            function search() {
                var sch = document.getElementById("searchbar").value;
                window.location = "http://localhost:8080/OnlineShoeStore/browseProducts.jsp?map=" + sch;
            }
        </script>
    </head>

    <body>
        <div class="row" id="topthree">
            <div class="col-md-8"><marquee style="font-family: cursive; color: #1b6d85">you can see the latest news here. Stick with us for new discounts and lots of valuable gifts</marquee></div>
            <div class="col-md-4 col-xs-12">
                <ul class="topbar navbar-right">
                    <li><span><span class="glyphicon glyphicon-plane"></span><a href="#"> Shipping & Return</a></span></li>


                    <%
                        if (request.getSession().getAttribute("user") == null) {

                    %>

                    <li><span><span class="glyphicon glyphicon-fire"></span><a href="createAnAccount.jsp"> Create an Account</a></span></li>
                    <li><span><span class="fa fa-sign-in"></span><a href="login.jsp"> Login</a></span></li>

                    <% } else {
                        DB.User userObj = (DB.User) request.getSession().getAttribute("user");
                    %>

                    <li><span><span class="glyphicon glyphicon-user"></span><a href="#"> <%=userObj.getFname()%></a></span></li>

                    <%

                        if (userObj.getUserType().getUserType().equals("seller")) { %>

                    <li><span><span class="fa fa-plus"></span><a href="addproducts.jsp"> Add Products</a></span></li>

                    <%
                        }
                    %>
                    <li><span><span class="glyphicon glyphicon-heart"></span><a href="wishlist.jsp"> Wish List</a></span></li>
                    <li><span><span class="fa fa-sign-out"></span><a href="login?type=Logout"> Logout</a></span></li>
                            <%
                                }
                            %>
            </div>
        </div>
        <div class="row">
            <div class="col-md-4"><a href="index.jsp"><img src="img/logo.png" class="img-responsive"></a></div>
            <div class="col-md-6">
                <div class="input-group">
                    <input type="text" class="form-control" placeholder="Search for..." id="searchbar" style="margin-top: 2px;">
                    <span class="input-group-btn">
                        <button class="btn btn-primary glyphicon glyphicon-search" type="button" onclick="search()"></button>
                    </span>
                </div>
            </div>
            <div class="col-md-2"><a href="cart.jsp" style="text-decoration: none"><button id="hederCartButton" type="button" class="btn btn-block btn-success" aria-label="Left Align"> <span class="glyphicon glyphicon-shopping-cart" aria-hidden="true"></span> Rs:
                        <%if (request.getSession().getAttribute("cartTotal") == null) {
                        %>0.00<%
                        } else {
                        %> 
                        <%=(Double) request.getSession().getAttribute("cartTotal")%>
                        <%}%>
                    </button></a></div>
        </div>
    </body>
</html>
