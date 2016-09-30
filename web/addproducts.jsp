<%-- 
    Document   : addproducts
    Created on : Sep 22, 2016, 11:13:56 PM
    Author     : Shanaka
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Add products</title>
        <link rel="stylesheet" href="css/bootstrap.min.css">
        <link rel="stylesheet" href="css/custom.css">
        <style>
            .topbar li a{
                color: white;
            }
            .topbar li{
                color: whitesmoke;
            }
        </style>

    </head>


    <body id="addproduct">
        <div class="col-md-1"></div>
        <div class="col-md-10">
            <div class="row">
                <div>
                    <%@include file="header.jsp" %>
                </div>
            </div>
            <div class="row" style="margin-top: 10px;">
                <div class="col-md-12"><center><span class="h2" style="color: white;">Add Products to sell</span></center></div>
            </div>
                <div class="row" style="margin-top: 30px;">
                <div class="col-md-6"></div>
                <div class="col-md-6">
                    <form class="form">
                        <div class="col-md-8"><input type="text" class="form-control" placeholder="Product Name"></div>
                        <div class="col-md-8"><input type="text" class="form-control" placeholder="Enter Price"></div>
                    </form>
                </div>
            </div>

        </div>
        <div class="col-md-1"></div>




        <script src="js/jquery-3.1.0.min.js"></script>       
        <script src="js/bootstrap.min.js"></script> 
    </body>
</html>
