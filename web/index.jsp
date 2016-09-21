<%-- 
    Document   : index
    Created on : Sep 2, 2016, 5:22:16 PM
    Author     : Shanaka
--%>

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
                    <div class="row" id="topthree">
                        <div class="col-md-8"><marquee style="font-family: cursive; color: #1b6d85"> you can see the latest news here. Stick with us for new discounts and lots of valuable gifts</marquee></div>
                        <div class="col-md-4 col-xs-8">
                            <ul class="topbar navbar-right">
                                <li><span class="glyphicon glyphicon-plane"></span><a href="#"> Shipping & Return</a></li>
                                <li><span class="glyphicon glyphicon-fire"></span><a href="createAnAccount.jsp"> Create an Account</a></li>
                                <li><span class="glyphicon glyphicon-user"></span><a href="#"> Login</a></li>
                            </ul>
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
                    <div class="col-md-3" id="category">
                        <div class="row btn-group">
                            <button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                Action <span class="caret"></span>
                            </button>
                            <ul class="dropdown-menu">
                                <li><a href="#">Action</a></li>
                                <li><a href="#">Another action</a></li>
                                <li><a href="#">Something else here</a></li>
                                <li role="separator" class="divider"></li>
                                <li><a href="#">Separated link</a></li>
                            </ul>
                        </div>
                    </div>

                    <!--Slider included -->
                    <div class="col-md-7 hidden-xs" id="slider" style="padding:0px; margin:0px; background-color:#fff;font-family:Arial, sans-serif">
                        <%@include file="slider.jsp" %>
                    </div>
                    
                    <!-- advertisement -->
                    <div class="cl-md-2 hidden-xs"><img src="img/combank.png"></div>
                </div>
                <div class="row" style="margin-top: 80px;">
                    <div class="col-sm-6 col-md-3" style="text-align: center">
                        <div class="thumbnail">
                            <img src="img/1.jpg" alt="sport">
                            <div class="caption">
                                <h3>Omega Black</h3>
                                <p>Cras justo odio, dapibus ac facilisis in, egestas eget quam. Donec id elit non mi porta gravida at eget metus. Nullam id dolor id nibh ultricies vehicula ut id elit.</p>
                                <p><a href="#" class="btn btn-success" role="button">Buy Now</a></p>
                            </div>
                        </div>
                    </div>
                    <div class="col-sm-6 col-md-3" style="text-align: center">
                        <div class="thumbnail">
                            <img src="img/1.jpg" alt="sport">
                            <div class="caption">
                                <h3>Omega Black</h3>
                                <p>Cras justo odio, dapibus ac facilisis in, egestas eget quam. Donec id elit non mi porta gravida at eget metus. Nullam id dolor id nibh ultricies vehicula ut id elit.</p>
                                <p><a href="#" class="btn btn-success" role="button">Buy Now</a></p>
                            </div>
                        </div>
                    </div>
                    <div class="col-sm-6 col-md-3" style="text-align: center">
                        <div class="thumbnail">
                            <img src="img/1.jpg" alt="sport">
                            <div class="caption">
                                <h3>Omega Black</h3>
                                <p>Cras justo odio, dapibus ac facilisis in, egestas eget quam. Donec id elit non mi porta gravida at eget metus. Nullam id dolor id nibh ultricies vehicula ut id elit.</p>
                                <p><a href="#" class="btn btn-success" role="button">Buy Now</a></p>
                            </div>
                        </div>
                    </div>
                    <div class="col-sm-6 col-md-3" style="text-align: center">
                        <div class="thumbnail">
                            <img src="img/1.jpg" alt="sport">
                            <div class="caption">
                                <h3>Omega Black</h3>
                                <p>Cras justo odio, dapibus ac facilisis in, egestas eget quam. Donec id elit non mi porta gravida at eget metus. Nullam id dolor id nibh ultricies vehicula ut id elit.</p>
                                <p><a href="#" class="btn btn-success" role="button">Buy Now</a></p>
                            </div>
                        </div>
                    </div>
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
