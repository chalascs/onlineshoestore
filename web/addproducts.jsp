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
                <div class="col-md-12"><center><label class="h2 text-uppercase" style="color: white">Add Products to sell</label></center></div>
            </div>
            <div class="row" style="margin-top: 30px;">

                <div class="col-md-6">

                    <form class="form text-capitalize">
                        <div class="col-md-8"><input type="text" class="form-control" placeholder="Product ID"></div>
                        <div class="col-md-8"><input type="text" class="form-control" placeholder="Product Name"></div>
                        <div class="col-md-8"><input type="text" class="form-control" placeholder="Enter Price"></div>
                        <div class="col-md-8">
                            <label class="">Select your targeted population</label>
                            <div class="row">
                                <div class="col-md-5">
                                    <div class="radio"><label><input type="radio" name="optradio" value="women">Women</label></div>
                                    <div class=" radio"><label><input type="radio" name="optradio" value="men">Men</label></div>
                                </div>
                                <div class="col-md-6 ">
                                    <div class=" radio"><label><input type="radio" name="optradio" value="girls">Girls</label></div>
                                    <div class=" radio"><label><input type="radio" name="optradio" value="boys">Boys</label></div>
                                </div>
                            </div>
                        </div>

                        <div class="form-group col-md-8">
                            <label for="gender">Which type is your product?</label>
                            <select class="form-control" id="gender">
                                <option>Boots</option>
                                <option>Lace-ups</option>
                                <option>Clogs & Mules</option>
                                <option>Running shoes</option>
                                <option>Sandals</option>
                                <option>Slip-ons</option>
                                <option>Slippers</option>
                                <option>Sneakers</option>
                            </select>
                        </div>
                        <div class="col-md-8"><textarea class="form-control" placeholder="Product Discription (This will show below the product)"></textarea></div>
                        <div class="col-md-8"><input type="text" class="form-control" placeholder="Discount(%)"></div>

                    
                </div>


                <div class="col-md-6">
                    <div class="col-md-8 row">
                        <label>Sizes & Quantity</label>
                        <div class="row">
                            <div class="col-md-4">
                                <input type="text" class="form-control" placeholder="Size">
                            </div>
                            <div class="col-md-4">
                                <input type="text" class="form-control" placeholder="QTY">
                            </div>
                            
                            <div class="col-md-4">
                                <input type="button" class="btn btn-danger" value="Apply">
                            </div>
                        </div>
                        <div class="col-md-8">
                            <table class="table table-responsive table-striped ">
                                
                            </table>
                        </div>


                    </div>

                </div>
                </form>
            </div>
            <hr>
        </div>
        <div class="col-md-1"></div>




        <script src="js/jquery-3.1.0.min.js"></script>       
        <script src="js/bootstrap.min.js"></script> 
    </body>
</html>
