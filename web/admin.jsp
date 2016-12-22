<%-- 
    Document   : admin
    Created on : Dec 15, 2016, 2:36:18 PM
    Author     : Shanaka
--%>

<%@page import="DB.UserType"%>
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

            function proinfo(invid) {
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

            //file upload part
            function getFileName() {

                var filename = document.getElementById("selectFile").value;
                var f = filename.split("\\");

                document.getElementById("fileName").value = f[f.length - 1];
                var a = document.getElementById("selectFile").files;
                for (var i = 0; i < a.length; i++) {
                    alert(a[i].name + " , " + ((a[i].size / 1024) / 1024) / 1024);
                }
            }
            function readURL(input) {
                getFileName();
                var c = 0;
                for (var i = 0; i < input.files.length; i++) {
                    if (input.files[i] !== null) {
                        var reader = new FileReader();
                        reader.onload = function(e) {
                            var elem = document.createElement("img");
                            elem.setAttribute("id", c);
                            elem.setAttribute("class", "myimgs");
                            elem.setAttribute("src", e.target.result);
                            elem.setAttribute("height", "100");
                            elem.setAttribute("width", "100");
                            elem.setAttribute("onclick", 'deleteimage(' + c + ')');
                            document.getElementById("myimg").appendChild(elem);
                            c++;
                        };
                        reader.readAsDataURL(input.files[i]);
                    }
                }
            }
            function deleteimage(x) {
                $("#" + x).remove();
            }
            //end of file upload

            function saveadd() {
                alert("awa");
                var type = "saveadd";
                var xhttp = new XMLHttpRequest();
                xhttp.onreadystatechange = function() {
                    if (xhttp.readyState === 4 && xhttp.status === 200) {
                        window.location.href = "admin.jsp";
                    }
                };
                xhttp.open("GET", "admin?type=" + type, true);
                xhttp.send();
            }
            function seller(userid) {
                var type = "sellerinfo";
                var xhttp = new XMLHttpRequest();
                xhttp.onreadystatechange = function() {
                    if (xhttp.readyState === 4 && xhttp.status === 200) {
                        window.location.href = "admin.jsp";
                    }
                };
                xhttp.open("GET", "admin?type=" + type + "&userid=" + userid, true);
                xhttp.send();

            }
            function lout() {
                
                var type = "Logout";
                var xhttp = new XMLHttpRequest();
                xhttp.onreadystatechange = function() {
                    if (xhttp.readyState === 4 && xhttp.status === 200) {
                        window.location.href = "sadminlogin.jsp";
                    }
                };
                xhttp.open("GET", "admin?type=" + type, true);
                xhttp.send();
            }
            function uu(userid) {
                var type = "selinfo";
                alert("asdsa");
                var xhttp = new XMLHttpRequest();
                xhttp.onreadystatechange = function() {
                    if (xhttp.readyState === 4 && xhttp.status === 200) {
                        document.getElementById("sellerinf").innerHTML = xhttp.responseText;
                    }
                };
                xhttp.open("GET", "admin?type=" + type + "&userid=" + userid, true);
                xhttp.send();
            }
        </script>
    </head>
    <body style="background-color: #eee">
        <%
            if (request.getSession().getAttribute("admin") == null) {
                response.sendRedirect("sadminlogin.jsp");
            } else {
        %>
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
                                    <a href="#messages" data-toggle="tab" class="btn btn-info btn-lg" role="button"><span class="glyphicon glyphicon-comment"></span> <br/>Seller</a>
                                    <!--<a href="#ads" data-toggle="tab" class="btn btn-primary btn-lg" role="button"><span class="glyphicon glyphicon-leaf"></span> <br/>Adds</a>-->

                                </div>
                            </div>
                            <a class="btn btn-success btn-lg btn-block" role="button" onclick="lout()"><span class="glyphicon glyphicon-globe"></span> Logout</a>
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
//                                        cr.add(Restrictions.eq("uid", uid));
                                        Criteria cr = ses.createCriteria(DB.User.class);
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
                                        <%} else if (i == 2) {%>
                                        <td>Deactivated<span class="fa fa-times-circle text-danger"></span> </td>
                                        <%} else if (i == 0) {%>
                                        <td>Not Verified<span class="fa fa-times-circle text-warning"></span> </td>    
                                        <%}
                                            if (i == 1) {
                                        %>
                                        <td>Deactivate? <input type="checkbox" class="checkbox-inline" onclick="action(<%=u.getUid()%>)"> <i class="fa fa-times-circle text-danger"></i></td>
                                            <%} else if (i == 2) {%>
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
                                    <div class="col-md-12" style="margin-top: 10px;" id="table" >
                                        <table class="table table-responsive table-striped table-bordered table-hover">
                                            <thead>
                                                <tr>
                                                    <td>Image</td>
                                                    <td>Product</td>
                                                    <td>Price</td>
                                                    <td>Status</td>
                                                    <td>Action</td>
                                                </tr>
                                            </thead>
                                            <%
                                                Criteria crt = ses.createCriteria(DB.Stock.class);
                                                List<DB.Stock> l = crt.list();
                                                for (DB.Stock st : l) {
                                            %>
                                            <tr>
                                                <td><img src="<%=st.getImage()%>" width="70px;" height="70px;" class="img-circle"></td>
                                                <td><%=st.getProductName()%></td>
                                                <td><%=st.getPrice()%></td>
                                                <%
                                                    int i = st.getStatus();
                                                    if (i == 1) {
                                                %>
                                                <td id="one">Active <span class="fa fa-check-circle text-success"></span> </td>
                                                <%} else if (i == 0) {%>
                                                <td>Deactivated<span class="fa fa-times-circle text-danger"></span> </td>
                                                <%}
                                                    if (i == 1) {
                                                %>
                                                <td>Deactivate? <input type="checkbox" class="checkbox-inline" onclick="product(<%=st.getStid()%>)"> <i class="fa fa-times-circle text-danger"></i></td>
                                                    <%} else if (i == 0) {%>
                                                <td>Activate? <input type="checkbox" class="checkbox-inline" onclick="product(<%=st.getStid()%>)"> <i class="fa fa-check-circle text-success"></i></td>
                                                    <%}
                                                        }%>
                                                <td></td>
                                                <td></td>
                                            </tr>
                                        </table>
                                    </div>
                                </div>
                                <div class="col-md-3"></div>
                            </div>
                        </div>
                        <div class="tab-pane fade" id="ads">
                            <div class="row">
                                <div class="col-md-3"></div>
                                <div class="col-md-6 text-center">
                                    <div class="col-md-12"><h3 class="text-danger">Invoices</h3></div>
                                    <div class="col-md-12">
                                        <div class="row">
                                            <!-- File Upload--> 
                                            <div class="row">  
                                                <form enctype="multipart/form-data" method="post" id="uploadForm" action="adupload">
                                                    <div class="row">
                                                        <div id="progressBox" class="col-md-7">
                                                            <input disabled="disabled" id="fileName" placeholder="Choose File"/>
                                                            <div id="upFile" class="btn btn-primary">
                                                                <span>Select</span>
                                                                <input onchange="readURL(this)" class="upload" type="file" name="myfile" id="selectFile" multiple/>
                                                            </div>
                                                            <div class="progress col-md-8">
                                                                <div class="progress-bar progress-bar-success progress-bar-striped active" id="pBar"></div>
                                                            </div>
                                                            <br>
                                                        </div>
                                                    </div>
                                                    <br>
                                                    <input class="btn btn-danger" type="submit" value="Upload My File"/>
                                            </div>
                                            <div class="row">
                                                <button onclick="saveadd()">Save it</button>
                                            </div>
                                            <div id="myimg" class="col-md-4">
                                            </div>
                                            </form>
                                        </div>
                                    </div>
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
                                    <div class="col-md-12" id="producthis" style="width: 500px; height: 800px;">

                                    </div>

                                </div>
                                <div class="col-md-3"></div>
                            </div>
                        </div>
                        <div class="tab-pane fade" id="messages">
                            <div class="row">
                                <div class="col-md-3"></div>
                                <div class="col-md-6 text-center">
                                    <div class="col-md-12"><h3 class="text-danger">Sellers</h3></div>
                                    <div class="col-md-12">
                                        <table class="table table-striped">
                                            <thead>
                                                <tr>
                                                    <td>First Name</td>
                                                    <td>Last Name</td>
                                                    <td>Status</td>
                                                    <td>Action</td>
                                                </tr>
                                            </thead>
                                            <%
//                                        DB.User us = (User) request.getSession().getAttribute("user");
//                                        int uid = us.getUid();
//                                        cr.add(Restrictions.eq("uid", uid));
                                                String s = "seller";
                                                Criteria aa = ses.createCriteria(DB.UserType.class);
                                                aa.add(Restrictions.eq("userType", s));
                                                DB.UserType uuu = (UserType) aa.uniqueResult();

                                                Criteria cdr = ses.createCriteria(DB.User.class);
                                                cdr.add(Restrictions.eq("userType", uuu));
                                                List<DB.User> lel = cdr.list();
                                                for (DB.User u : lel) {

                                            %>
                                            <tr onclick="uu(<%=u.getUid()%>)" href="#seller" data-toggle="tab">

                                                <td><%=u.getFname()%></td>
                                                <td><%=u.getLname()%></td>
                                                <%
                                                    int i = u.getStatus();
                                                    if (i == 1) {
                                                %>
                                                <td id="one">Active <span class="fa fa-check-circle text-success"></span> </td>
                                                <%} else if (i == 2) {%>
                                                <td>Deactivated<span class="fa fa-times-circle text-danger"></span> </td>
                                                <%} else if (i == 0) {%>
                                                <td>Not Verified<span class="fa fa-times-circle text-warning"></span> </td>    
                                                <%}
                                                    if (i == 1) {
                                                %>
                                                <td>Deactivate? <input type="checkbox" class="checkbox-inline" onclick="seller(<%=u.getUid()%>)"> <i class="fa fa-times-circle text-danger"></i></td>
                                                    <%} else if (i == 2) {%>
                                                <td>Activate? <input type="checkbox" class="checkbox-inline" onclick="seller(<%=u.getUid()%>)"> <i class="fa fa-check-circle text-success"></i></td>
                                                    <%}
                                                        }%>
                                            </tr> 
                                        </table>
                                    </div>

                                </div>
                                <div class="col-md-3"></div>
                            </div>
                        </div>
                        <div class="tab-pane fade" id="seller">
                            <div class="row">
                                <div class="col-md-12">Sales</div>
                                <div class="col-md-12">
                                    <div class="col-md-12" id="sellerinf">

                                    </div>

                                </div>
                            </div>


                        </div>
                    </div>
                </div>
            </div>
            <%}%>
    </body>
</html>
