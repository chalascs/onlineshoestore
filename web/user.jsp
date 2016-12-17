<%-- 
    Document   : user
    Created on : Dec 17, 2016, 7:19:26 PM
    Author     : Shanaka
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Shoe Mart/User</title>
        <link rel="stylesheet" href="css/bootstrap.min.css">
        <link rel="stylesheet" href="css/custom.css">
        <link rel="stylesheet" href="css/font-awesome.min.css">
        <script src="js/jquery-3.1.0.min.js"></script>       
        <script src="js/bootstrap.min.js"></script> 
    </head>
    <body id="fullpage">
        <div class="row">
            <div class="col-md-1"></div>
            <div class="col-md-10">
                <div class="row">
                    <%@include file="header.jsp" %>
                </div>
                <div class="row" style="margin-top: 20px;">
                    <div class="">
                        <ul class="nav nav-tabs">
                            <li class="active"><a href="#home" data-toggle="tab">Profile</a></li>
                            <li><a href="#pass" data-toggle="tab">Password</a></li>
                            <li><a href="#address" data-toggle="tab">Address</a></li>
                            <li><a href="#invoices" data-toggle="tab">Invoices</a></li>
                        </ul>
                        <div id="myTabContent" class="tab-content">
                            <div class="tab-pane active in" id="home">
                                
                            </div>
                            <div class="tab-pane fade" id="pass"></div>
                            <div class="tab-pane fade" id="address"></div>
                            <div class="tab-pane fade" id="invoices">
                                <input type="text" class="form-control">
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-md-1"></div>
        </div>
    </body>
</html>
