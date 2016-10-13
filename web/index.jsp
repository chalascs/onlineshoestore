<%-- 
    Document   : index
    Created on : Sep 2, 2016, 5:22:16 PM
    Author     : Shanaka
--%>

<%@page import="connection.NewHibernateUtil"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Shoe Mart</title>
        <link rel="stylesheet" href="css/bootstrap.min.css">
        <link rel="stylesheet" href="css/custom.css">
    </head>
    <body>
        <div class="row" id="fullpage">
            <div class="col-md-1"></div>
            <div class="col-md-10" id="container">
                <!-- header section -->
                <div>
                    <!-- Header -->
                    <%@include file="header.jsp" %>
                </div>
                <div class="row">
                    <div class="col-md-3"></div>
                    <div class="col-md-7 navbar-nav col-xs-12" id="mid_nav">

                        <ul class="info col-xs-12">
                            <li><a href="#"><strong><span class="glyphicon glyphicon-folder-open"></span>  Browse</strong></a></li>
                            <li><a href="#"><strong><span class="glyphicon glyphicon-send"></span>  Latest</strong></a></li>
                            <li><a href="#"><strong><span class="glyphicon glyphicon-certificate"></span>  Special</strong></a></li>
                            <li><a href="#"><strong><span class="glyphicon glyphicon-tags"></span>  Brands</strong></a></li> 
                        </ul>

                    </div>
                    <div class="col-md-2"></div>
                </div>
                <div class="row">
                    <div class="col-md-3" >
                        <%@include file="leftdropdown.jsp" %>
                    </div>

                    <!--Slider included -->
                    <div class="col-md-7 hidden-xs" id="slider" >
                        <%@include file="slider.jsp" %>
                    </div>

                    <!-- advertisement -->
                    <div class="cl-md-3 hidden-xs">
                        <img src="img/combank.png">
                    </div>
                </div>


                <div class="row" style="margin-top: 80px;">
                    <%
                        Session ses = NewHibernateUtil.getSessionFactory().openSession();
                        Criteria cr = ses.createCriteria(DB.Stock.class);
                        List<DB.Stock> li = cr.list();
                        for (DB.Stock stock : li) {
                    %>
                    <div class="col-sm-6 col-md-3" style="text-align: center">
                        <div class="thumbnail">
                            <img src="<%=stock.getImage()%>" alt="shoes">
                            <div class="caption">
                                <h3><%=stock.getProductName()%></h3>
                                <p><%=stock.getDiscription()%></p>
                                <p><a href="<%=stock.getImage() %>" class="btn btn-success" role="button">Buy Now</a></p>
                            </div>
                        </div>
                    </div>  
                    <%}%>
                </div>
            </div>
            <div class="col-md-1"></div>         
        </div>
        <div class="row" id="footer">
            <%@include file="footer.jsp" %>
        </div>            
        <script src="js/jquery-3.1.0.min.js"></script>       
        <script src="js/bootstrap.min.js"></script>  

    </body>
</html>
