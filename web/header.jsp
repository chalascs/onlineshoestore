<%-- 
    Document   : header
    Created on : Sep 22, 2016, 11:16:51 PM
    Author     : Shanaka
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <div class="row" id="topthree">
            <div class="col-md-8"><marquee style="font-family: cursive; color: #1b6d85">you can see the latest news here. Stick with us for new discounts and lots of valuable gifts</marquee></div>
            <div class="col-md-4 col-xs-8">
                <ul class="topbar navbar-right">
                    <li><span class="glyphicon glyphicon-plane"></span><a href="#"> Shipping & Return</a></li>


                    <%
                        if (request.getSession().getAttribute("user") == null) {

                    %>

                    <li><span class="glyphicon glyphicon-fire"></span><a href="createAnAccount.jsp"> Create an Account</a></li>
                    <li><span class="glyphicon glyphicon-user"></span><a href="login.jsp"> Login</a></li>
                    
                    <% } else { %>

                    <li><span class="glyphicon glyphicon-user"></span><a href="#"> <%=request.getSession().getAttribute("user").toString()%></a></li>
                    <li><span class="glyphicon glyphicon-fire"></span><a href="addproducts.jsp"> Add Products</a></li>

                    <%}%>
            </div>
        </div>
        <div class="row">
            <div class="col-md-4"><a href="index.jsp"><img src="img/logo.png" class="img-responsive"></a></div>
            <div class="col-md-6">
                <div class="input-group">
                    <input type="text" class="form-control" placeholder="Search for..." style="margin-top: 2px;">
                    <span class="input-group-btn">
                        <button class="btn btn-primary glyphicon glyphicon-search" type="button"></button>
                    </span>
                </div>
            </div>
            <div class="col-md-2"><button type="button" class="btn btn-block btn-success" aria-label="Left Align"> <span class="glyphicon glyphicon-shopping-cart" aria-hidden="true"></span> Rs.0.00</button></div>
        </div>
    </body>
</html>