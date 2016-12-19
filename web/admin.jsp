<%-- 
    Document   : admin
    Created on : Dec 15, 2016, 2:36:18 PM
    Author     : Shanaka
--%>

<%@page import="java.util.List"%>
<%@page import="org.hibernate.criterion.Restrictions"%>
<%@page import="DB.User"%>
<%@page import="org.hibernate.Criteria"%>
<%@page import="connection.NewHibernateUtil"%>
<%@page import="org.hibernate.Session"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <!--        <link href="css/sadmin.css" rel="stylesheet">-->
        <link rel="stylesheet" href="css/bootstrap.min_1.css">
        <link rel="stylesheet" href="css/custom.css">
        <link rel="stylesheet" href="css/font-awesome.min.css">
        <script src="js/jquery-3.1.0.min.js" type="text/javascript"></script>
        <script src="js/jquery.form.js" type="text/javascript"></script>
        <script src="js/progressBarScript.js" type="text/javascript"></script>
        <script src="js/bootstrap.min.js"></script>
        <style>
            body { padding-top:20px; }
            .panel-body .btn:not(.btn-block) { width:120px;margin-bottom:10px; }
        </style>
        <script type="text/javascript">

            function action(uid) {
                var type = "userActivation";

                var xhttp = new XMLHttpRequest();
                xhttp.onreadystatechange = function() {
                    if (xhttp.readyState === 4 && xhttp.status === 200) {
                        window.location.href = "admin.jsp";
                    }
                };
                xhttp.open("GET", "admin?type=" + type + "&uid=" + uid, true);
                xhttp.send();
            }


            function search() {
                var type = "searchProduct";
                var search = document.getElementById("searchbar").value;
                var xhttp = new XMLHttpRequest();
                xhttp.onreadystatechange = function() {
                    if (xhttp.readyState === 4 && xhttp.status === 200) {
                        document.getElementById("table").innerHTML = xhttp.responseText;
                    }
                };
                xhttp.open("GET", "admin?type=" + type + "&search=" + search, true);
                xhttp.send();

            }
            function product(pid) {

                var type = "prodActivation";
                var search = document.getElementById("searchbar").value;
                var xhttp = new XMLHttpRequest();
                xhttp.onreadystatechange = function() {
                    if (xhttp.readyState === 4 && xhttp.status === 200) {
                        document.getElementById("table").innerHTML = xhttp.responseText;
                    }
                };
                xhttp.open("GET", "admin?type=" + type + "&pid=" + pid, true);
                xhttp.send();
            }
            function user(uid) {
                var type = "userHistory";
                
                var xhttp = new XMLHttpRequest();
                xhttp.onreadystatechange = function() {
                    if (xhttp.readyState === 4 && xhttp.status === 200) {
                        document.getElementById("history").innerHTML = xhttp.responseText;
                    }
                };
                xhttp.open("GET", "admin?type=" + type + "&uid=" + uid, true);
                xhttp.send();
            }
            
            function proinfo(invid){
                 var type = "invoicesproducts";
                
                var xhttp = new XMLHttpRequest();
                xhttp.onreadystatechange = function() {
                    if (xhttp.readyState === 4 && xhttp.status === 200) {
                        document.getElementById("producthis").innerHTML = xhttp.responseText;
                    }
                };
                xhttp.open("GET", "admin?type=" + type + "&invid=" + invid, true);
                xhttp.send();
            }

        </script>
    </head>
    <body style="background-color: #eee">
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <div class="panel panel-primary">
                        <div class="panel-heading" style="margin-bottom: 10px;">
                            <h3 class="panel-title text-center">
                                <span class="glyphicon glyphicon-bookmark"></span> Welcome Admin!</h3>
                        </div>
                        <div class="panel-body">
                            <div class="row">
                                <div class="col-xs-12 col-md-12 text-center">
                                    <a href="#user" data-toggle="tab" class="btn btn-danger btn-lg active" role="button"><span class="glyphicon glyphicon-user"></span> <br/>Users</a>
                                    <a href="#products" data-toggle="tab" class="btn btn-warning btn-lg" role="button"><span class="glyphicon glyphicon-shopping-cart"></span> <br/>Products</a>
                                    <a href="#messages" data-toggle="tab" class="btn btn-info btn-lg" role="button"><span class="glyphicon glyphicon-comment"></span> <br/>Messages</a>
                                    <a href="#ads" data-toggle="tab" class="btn btn-primary btn-lg" role="button"><span class="glyphicon glyphicon-leaf"></span> <br/>Adds</a>

                                </div>
                            </div>
                            <a class="btn btn-success btn-lg btn-block" role="button"><span class="glyphicon glyphicon-globe"></span> Website</a>
                        </div>
                    </div>
                    <div class="tab-content" id="myTabContent">
                        <div class="tab-pane active in" id="user">
                            <div class="col-md-3"></div>
                            <div class="col-md-6">
                                <table class="table table-responsive table-hover">
                                    <thead>
                                        <tr>
                                            <td>User ID</td>
                                            <td>First Name</td>
                                            <td>Last Name</td>
                                            <td>Status</td>
                                            <td>Action</td>
                                        </tr>
                                    </thead>
                                    <%
                                        Session ses = NewHibernateUtil.getSessionFactory().openSession();

//                                        DB.User us = (User) request.getSession().getAttribute("user");
//                                        int uid = us.getUid();
                                        Criteria cr = ses.createCriteria(DB.User.class);
//                                        cr.add(Restrictions.eq("uid", uid));
                                        List<DB.User> li = cr.list();
                                        for (DB.User u : li) {

                                    %>
                                    <tr onclick="user(<%=u.getUid()%>)" href="#uinfo" data-toggle="tab">
                                        <td><%=u.getUid()%></td>
                                        <td><%=u.getFname()%></td>
                                        <td><%=u.getLname()%></td>
                                        <%
                                            int i = u.getStatus();
                                            if (i == 1) {
                                        %>
                                        <td id="one">Active <span class="fa fa-check-circle text-success"></span> </td>
                                        <%} else if (i == 0) {%>
                                        <td>Deactivated<span class="fa fa-times-circle text-danger"></span> </td>
                                        <%}
                                            if (i == 1) {
                                        %>
                                        <td>Deactivate? <input type="checkbox" class="checkbox-inline" onclick="action(<%=u.getUid()%>)"> <i class="fa fa-times-circle text-danger"></i></td>
                                            <%} else if (i == 0) {%>
                                        <td>Activate? <input type="checkbox" class="checkbox-inline" onclick="action(<%=u.getUid()%>)"> <i class="fa fa-check-circle text-success"></i></td>
                                            <%}
                                                }%>
                                    </tr> 
                                </table>
                            </div>
                            <div class="col-md-3"></div>
                        </div>
                        <div class="tab-pane fade" id="products">
                            <div class="row">
                                <div class="col-md-3"></div>
                                <div class="col-md-6 text-center">
                                    <div class="col-md-12"><h3>All Products</h3></div>
                                    <div class="col-md-12">
                                        <div class="input-group ">
                                            <input type="text" class="form-control" placeholder="Product Name" id="searchbar" >
                                            <span class="input-group-btn">
                                                <button class="btn btn-primary " type="button" onclick="search()"><i class="fa fa-search"></i></button>
                                            </span>
                                        </div>
                                    </div>
                                    <div class="col-md-12" style="margin-top: 10px;" id="table">

                                    </div>
                                </div>
                                <div class="col-md-3"></div>
                            </div>
                        </div>
                        <div class="tab-pane fade" id="invoice">
                            <div class="row">
                                <div class="col-md-3"></div>
                                <div class="col-md-6 text-center">
                                    <div class="col-md-12"><h3 class="text-danger">Invoices</h3></div>
                                </div>
                                <div class="col-md-3"></div>
                            </div>
                        </div>       
                        <div class="tab-pane fade" id="uinfo">
                            <div class="row" >
                                <div class="col-md-3"></div>
                                <div class="col-md-6 text-center" >
                                    <div class="col-md-12"><h3 class="text-danger">Purchase History of Name</h3></div>
                                    <div class="col-md-12" id="history">
                                        <!--                                        <table class="table table-responsive table-striped">
                                                                                    <thead>
                                                                                        <tr>
                                                                                            <td>Date</td>
                                                                                            <td>Image</td>
                                                                                            <td>Product</td>
                                                                                            <td>Quantity</td>
                                                                                            <td>Total</td>
                                                                                        </tr>
                                                                                    </thead>
                                                                                    <tr>
                                                                                        <td></td>
                                                                                        <td></td>
                                                                                        <td></td>
                                                                                        <td></td>
                                                                                        <td></td>
                                                                                    </tr>
                                                                                </table>-->
                                    </div>
                                </div>
                                <div class="col-md-3"></div>
                            </div>
                        </div> 
                        <div class="tab-pane fade" id="prodinfo">
                            <div class="row">
                                <div class="col-md-3"></div>
                                <div class="col-md-6 text-center">
                                    <div class="col-md-12"><h3 class="text-danger">Products</h3></div>
                                    <div class="col-md-12" id="producthis">
                                  
                                    </div>
                                    
                                </div>
                                <div class="col-md-3"></div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
