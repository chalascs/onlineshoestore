<%-- 
    Document   : index
    Created on : Sep 2, 2016, 5:22:16 PM
    Author     : Shanaka
--%>

<%@page import="DB.Adds"%>
<%@page import="org.hibernate.criterion.Restrictions"%>
<%@page import="org.hibernate.criterion.Order"%>
<%@page import="DB.Stock"%>
<%@page import="connection.NewHibernateUtil"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Shoe Mart</title>
        <link rel="stylesheet" href="css/bootstrap.min.css">
        <link rel="stylesheet" href="css/custom.css">
        <link rel="stylesheet" href="css/font-awesome.min.css">
        <script src="js/jquery-3.1.0.min.js"></script>       
        <script src="js/bootstrap.min.js"></script> 
        <script>
            function addtocart(stid) {

                var xhttp = new XMLHttpRequest();
                var adcrt = document.getElementById("adcrt").value;
                var Type = "addtocart";
                xhttp.onreadystatechange = function() {
                    if (xhttp.readyState === 4 && xhttp.status === 200) {

                    }
                };
                xhttp.open("GET", "cart?adcrt=" + stid + "&Type=" + Type, true);
                xhttp.send();
            }

//            function wishlist(stid) {
//                var xhttp = new XMLHttpRequest();
//                var adwl = document.getElementById("wish").value;
//                var Type = "addtowish";
//                xhttp.onreadystatechange = function() {
//                    if (xhttp.readyState === 4 && xhttp.status === 200) {
//                    }
//                };
//                xhttp.open("GET", "wishlist?adwl=" + stid + "&Type=" + Type, true);
//                xhttp.send();
//            }


//            $(document).ready(function() {
//                $("#cl").hover(function() {
//                    $("#prudload").show(800);
//                });
//            });

            function loadPID(pid) {
                var url = "index.jsp?pid=" + pid;

                window.location.href = url;
//                window.scrollTo(0, 100);

            }
        </script>
        <style>
            /*            #prudload{
                            display: none;
                        }*/
            .pagination>li>a, .pagination>li>span { border-radius: 50% !important;margin: 0 5px;}
        </style>
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
                            <li><a href="http://localhost:8080/OnlineShoeStore/browseProducts.jsp?map=all"><strong><span class="glyphicon glyphicon-folder-open"></span>  Browse</strong></a></li>
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
                        <%
                        Session ses = NewHibernateUtil.getSessionFactory().openSession();
                            Criteria crr = ses.createCriteria(DB.Adds.class);
                            crr.add(Restrictions.eq("idadd", 3));
                            DB.Adds ad = (Adds)crr.uniqueResult();
                        %>
                        <img src="img/combank.png" width="180px" height="417">
                    </div>
                </div>
                <hr>
                <div class="row" style="margin-top: 50px;">
                    <div id="cl" style="margin-bottom: 20px;"class="col-md-12 text-center"><span class=" fa fa-3x"><kbd style="font-family: 'Quicksand', sans-serif;">Latest Products</kbd></span></div>
                </div>
                <div class="row" style="margin-top: 80px;" id="prudload">
                    <%                        
                        Criteria cr = ses.createCriteria(DB.Stock.class);
                        List<DB.Stock> lis = cr.list();
                        //pagination
                        Criteria cr1 = ses.createCriteria(DB.Stock.class);
                        cr1.add(Restrictions.eq("status", 1));
                        cr1.addOrder(Order.desc("stid"));
                        if (request.getParameter("pge") != null) {
                            int asd = Integer.parseInt(request.getParameter("pge"));
                            if (asd == 1) {
                                cr1.setMaxResults(4);
                            } else {
                                cr1.setFirstResult((Integer.parseInt(request.getParameter("pge")) * 4) - 4);
                                cr1.setMaxResults(4);
                            }
                        } else {
                            cr1.setMaxResults(4);
                        }

                        List<DB.Stock> li = cr1.list();

                        int pge = lis.size() % 4;

                        if (pge % 4 > 0) {
                            pge += 1;
                        }

                        for (DB.Stock stock : li) {
                            System.out.print(stock.getStid());
                    %>
                    <div class="col-sm-6 col-md-3" style="text-align: center">
                        <div class="thumbnail" style="background-color: #eee; border-radius: 20px; width: 250px; height: 370px;">
                            <img src="<%=stock.getImage()%>" alt="shoes" style="border-radius: 20px; width: 240px;height: 200px;">
                            <div class="caption">
                                <h3 id="pname"><%=stock.getProductName()%></h3>
                                <p style="font-weight: bold;color:#ff3366 ">Rs. <%=stock.getPrice()%></p>
                                <p><%=stock.getUser().getFname() %> <%=stock.getUser().getLname() %></p>
                                <div>
                                    <p><a  class="btn btn-success text-right" role="button" id="adcrt" onclick="addtocart(<%=stock.getStid()%>)" data-toggle="modal" data-target="#myModal">Buy Now</a></p>   
                                </div>
                                <!--                                <div class="col-md-6 text-left">                 
                                                                    <p><a style="border-radius: 5px;" class="btn btn-primary" role="button" id="wish" onclick="wishlist(<%=stock.getStid()%>)">Wish List</a></p>
                                                                </div>-->
                            </div>
                        </div>
                    </div>  
                    <%}%>

                </div>
                <div class="row">
                    <div class="col-md-6"></div>
                    <div class="col-md-6">
                        <%
                            for (int i = 0; i < pge; i++) {

                        %>

                        <input type="button" class="btn-link" onclick="location.href = 'index.jsp?pge=<%=i + 1%>'"value="<%=i + 1%>" >
                        <%}%>

                    </div>

                </div>
                <!-- Modal -->
                <div class="modal fade" id="myModal" role="dialog">
                    <div class="modal-dialog">
                        <div class="modal-body">
                            <div class="alert alert-success">
                                <strong>Success!</strong> Item added to your cart.
                            </div>
                        </div>
                    </div>
                </div>
                <!--end of the modal-->
            </div>
            <div class="col-md-1"></div>         
        </div>
        <div class="row" id="footer">
            <%@include file="footer.jsp" %>
        </div>            
    </body>
</html>
