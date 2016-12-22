<%-- 
    Document   : user
    Created on : Dec 17, 2016, 7:19:26 PM
    Author     : Shanaka
--%>

<%@page import="DB.Orders"%>
<%@page import="DB.Address"%>
<%@page import="DB.InvoiceItems"%>
<%@page import="org.hibernate.criterion.Order"%>
<%@page import="DB.User"%>
<%@page import="org.hibernate.criterion.Restrictions"%>
<%@page import="connection.NewHibernateUtil"%>
<%@page import="org.hibernate.Hibernate"%>
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
        <script>
            function address() {
                alert("called");
//                
                var add1 = document.getElementById("add1").value;
                var add2 = document.getElementById("add2").value;
                var province = document.getElementById("province").value;
                var district = document.getElementById("district").value;
                var city = document.getElementById("city").value;
                var type = "save";
////                
                var xhttp = new XMLHttpRequest();
                xhttp.onreadystatechange = function() {
                    if (xhttp.readyState === 4 && xhttp.status === 200) {

                    }
                };
//                xhttp.open("GET","address", true);
                xhttp.open("GET", "address?add1=" + add1 + "&add2=" + add2 + "&province=" + province + "&district=" + district + "&city=" + city + "&type=" + type, true);
                xhttp.send();
            }

            function update() {
            }

            function district() {
                var province = document.getElementById("province").value;
                var xhttp = new XMLHttpRequest();
                xhttp.onreadystatechange = function() {
                    if (xhttp.readyState === 4 && xhttp.status === 200) {
                        document.getElementById("district").innerHTML = xhttp.responseText;
                    }
                };

                xhttp.open("GET", "district?province=" + province, true);
                xhttp.send();
            }
            function city() {
                var district = document.getElementById("district").value;
                var xhttp = new XMLHttpRequest();
                xhttp.onreadystatechange = function() {
                    if (xhttp.readyState === 4 && xhttp.status === 200) {
                        document.getElementById("city").innerHTML = xhttp.responseText;
                    }
                };

                xhttp.open("GET", "city?district=" + district, true);
                xhttp.send();
            }

            function password() {
                var oldpw = document.getElementById("oldpw").value;
                var newpw = document.getElementById("newpw").value;
                var retype = document.getElementById("retype").value;
                var type = "changepass";

                if (newpw !== retype) {
                    document.getElementById("newpw").style.borderColor = "#E34234";
                    document.getElementById("retype").style.borderColor = "#E34234";
                    alert("Password does not matched");
                } else {

                    var xhttp = new XMLHttpRequest();
                    xhttp.onreadystatechange = function() {
                        if (xhttp.readyState === 4 && xhttp.status === 200) {
                            document.getElementById("oldpw").value = "";
                            document.getElementById("newpw").value = "";
                            document.getElementById("retype").value = "";
                            alert("Password Changed!");
                        }
                    };
                }
                xhttp.open("GET", "changepw?oldpw=" + oldpw + "&newpw=" + newpw + "&retype=" + retype + "&type=" + type, true);
                xhttp.send();
            }

            function profile() {
                var fname = document.getElementById("fname").value;
                var lname = document.getElementById("lname").value;
                var tel = document.getElementById("tel").value;
                var email = document.getElementById("email").value;
                var type = "updateuser";

                var xhttp = new XMLHttpRequest();
                xhttp.onreadystatechange = function() {
                    if (xhttp.readyState === 4 && xhttp.status === 200) {
                        alert("success!");
                        document.getElementById("fname").value = "";
                        document.getElementById("lname").value = "";
                        document.getElementById("tel").value = "";
                        document.getElementById("email").value = "";
                    }
                };
                xhttp.open("GET", "changepw?fname=" + fname + "&lname=" + lname + "&tel=" + tel + "&email=" + email + "&type=" + type, true);
                xhttp.send();
            }

            function activation(stid) {
                var type = "activation";
                var xhttp = new XMLHttpRequest();
                xhttp.onreadystatechange = function() {
                    if (xhttp.readyState === 4 && xhttp.status === 200) {
                        alert("Sucsess!");
                        window.location.href = "user.jsp";
                    }
                };
                xhttp.open("GET", "changepw?type=" + type + "&stid=" + stid, true);
                xhttp.send();
            }

            function updatestock() {
                var sttid = document.getElementById("sttid").value;
                var sizez = document.getElementById("sizez").value;
                var newe = document.getElementById("new").value;
                var type = "updatestock";
                if (sttid === null || sttid === "", sizez === null || sizez === "", newe === null || newe === "") {
                    alert("Please fill All");
                    return false;
                } else {
                    var xhttp = new XMLHttpRequest();
                    xhttp.onreadystatechange = function() {
                        if (xhttp.readyState === 4 && xhttp.status === 200) {
                            alert("Sucsess!");
                            document.getElementById("sttid").value = "";
                            document.getElementById("sizez").value = "";
                            document.getElementById("new").value = "";
                            window.location.href = "user.jsp";
                        }
                    }
                    ;
                    xhttp.open("GET", "changepw?type=" + type + "&sttid=" + sttid + "&sizez=" + sizez + "&newe=" + newe, true);
                    xhttp.send();

                }
            }
            function deliver(oderid) {
                var type = "deliver";
                var xhttp = new XMLHttpRequest();
                xhttp.onreadystatechange = function() {
                    if (xhttp.readyState === 4 && xhttp.status === 200) {
                        alert("Sucsess!");
                        window.location.href = "user.jsp";
                    }
                };
                xhttp.open("GET", "changepw?type=" + type + "&oderid=" + oderid, true);
                xhttp.send();
            }

        </script>


    </head>
    <body id="fullpage">
        <%            if (request.getSession().getAttribute("user") == null) {
                response.sendRedirect("login.jsp");
            } else {
                Session ses = NewHibernateUtil.getSessionFactory().openSession();
        %>
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
                            <li><a href="#Purchase" data-toggle="tab">Purchase History</a></li>
                                <%
                                    DB.User uss = (User) request.getSession().getAttribute("user");
                                    if (uss.getUserType().getUserType().equals("seller")) {
                                %>
                            <li><a href="#pruducts" data-toggle="tab">Products </a></li>
                            <li><a href="#Stockupdate" data-toggle="tab">Stock Update </a></li>
                                <%
                                    Criteria ctu = ses.createCriteria(DB.User.class);
                                    ctu.add(Restrictions.eq("uid", uss.getUid()));
                                    DB.User ussr = (User) ctu.uniqueResult();

                                    Criteria crt = ses.createCriteria(DB.Stock.class);
                                    crt.add(Restrictions.eq("user", ussr));
                                    List<DB.Stock> lol = crt.list();
                                    int ii = 0;
                                    for (DB.Stock st : lol) {
                                        System.out.println(st.getProductName());
                                        Criteria ct = ses.createCriteria(DB.Orders.class);
                                        int io = 0;
//                                        
                                        ct.add(Restrictions.and(Restrictions.eq("status", io), Restrictions.eq("stock", st)));
//                                        
                                        List<DB.Orders> or = ct.list();
//                                        
                                        for (DB.Orders od : or) {
                                            ii += 1;
//                                            
////                                        Criteria cr = ses.createCriteria(DB.Stock.class);
////                                        cr.add(Restrictions.eq("stid", od.getStock().getStid()));
////                                        List<DB.Stock> li = cr.list();
//
////                                        for (DB.Stock st : li) {
////                                            if(st.getUser().getUid() == ){}
////                                        }
                                        }
                                    }
                                %>
                            <li><a href="#orders" data-toggle="tab">Orders <span class="badge"><%=ii%></span></a></li>
                            <li><a href="#Porofit" data-toggle="tab">Transaction</a></li>
                                <%}%>
                        </ul>
                    </div>

                    <div id="myTabContent" class="tab-content">
                        <div class="tab-pane active in" id="home">
                            <div class="row text-center">

                                <div class="form" style="margin-top: 10px;">
                                    <div class="col-md-6 text-right">First Name</div>
                                    <div class="col-md-3 text-left"><input type="text" class="form-control" id="fname"></div>
                                    <div class="col-md-6 text-right">Last Name</div>
                                    <div class="col-md-3 text-left"><input type="text" class="form-control" id="lname"></div>
                                    <div class="col-md-6 text-right">Telephone</div>
                                    <div class="col-md-3 text-left"><input type="text" class="form-control" id="tel"></div>
                                    <div class="col-md-6 text-right">E-mail</div>
                                    <div class="col-md-3 text-left"><input type="text" class="form-control" id="email"></div>
                                    <div class="col-md-6 text-right"></div>
                                    <div class="col-md-2 text-right"><input type="Button" class="form-control btn btn-primary btn-sm" value="Update" onclick="profile()"></div>
                                </div>


                            </div>
                        </div>
                        <div class="tab-pane fade" id="pass">
                            <div class="row" style="margin-top: 10px;">
                                <div class="col-md-6 text-right">Type Old Password</div>
                                <div class="col-md-3"><input type="password" class="form-control" id="oldpw" ></div>
                                <div class="col-md-6 text-right">New Password</div>
                                <div class="col-md-3"><input type="password" class="form-control" id="newpw"></div>
                                <div class="col-md-6 text-right">Re-Type Password</div>
                                <div class="col-md-3"><input type="password" class="form-control" id="retype"></div>
                                <div class="col-md-6 text-right"></div>
                                <div class="col-md-2"><input type="button" onclick="password()" class="form-control" value="confirm"></div>
                            </div>
                        </div>
                        <div class="tab-pane fade" id="address">
                            <div class="row" style="margin-top: 10px;">
                                <div class="col-md-6 text-right">Address line 1</div>
                                <div class="col-md-3"><input type="text" class="form-control" placeholder="Address" id="add1"></div>
                                <div class="col-md-6 text-right">Address line 2</div>
                                <div class="col-md-3"><input type="text" class="form-control" placeholder="Address" id="add2"></div>
                                <div class="col-md-6 text-right">Province</div>
                                <div class="col-md-3 form-group"> 
                                    <select id="province" class="form-control" >
                                        <%
                                            Criteria ccr = ses.createCriteria(DB.Province.class);
                                            List<DB.Province> p = ccr.list();
                                            for (DB.Province po : p) {
                                        %>
                                        <option onclick="district()">
                                            <%=po.getProvince()%>
                                        </option>
                                        <%}%>
                                    </select>
                                </div>
                                <div class="col-md-6 text-right">District</div>
                                <div class="col-md-3">
                                    <select class="form-control" id="district">

                                    </select>
                                </div>
                                <div class="col-md-6 text-right">City</div>
                                <div class="col-md-3">
                                    <select class="form-control" id="city">

                                    </select>
                                </div>
                                <div class="col-md-6 text-right"></div>
                                <div class="col-md-2">
                                    <%
//                                            DB.User us1 = (DB.User) request.getSession().getAttribute("user");
//                                            int uuid = us1.getUid();
//                                            Criteria crz = ses.createCriteria(DB.User.class);
//                                            crz.add(Restrictions.eq("uid", uuid));
//                                            DB.User u1 = (DB.User) crz.uniqueResult();
//
//                                            Criteria cr5 = ses.createCriteria(DB.Address.class);
//                                            List<DB.Address> lii1 = cr5.list();
//                                            for (DB.Address ad : lii1) {
//
//                                                if (ad.getUser().getUid() != u1.getUid()) {
//                                                    boolean added = true;
//                                                }else{
//                                                  boolean  added = false;
//                                                }
//                                            }
                                    %>
                                    <button onclick="address()">confirm</button>
                                </div>
                                <% //}else{%>
                                <div class="col-md-2 text-left">
                                    <button onclick="update()">Update</button>
                                </div>
                                <% //}}%>
                            </div>
                        </div>
                        <div class="tab-pane fade" id="Purchase">
                            <div class="row" style="margin-top: 10px;">
                                <%                                        

                                    DB.User us = (DB.User) request.getSession().getAttribute("user");
                                    int uid = us.getUid();
                                    Criteria cr1 = ses.createCriteria(DB.User.class);
                                    cr1.add(Restrictions.eq("uid", uid));
                                    DB.User u = (DB.User) cr1.uniqueResult();

                                    Criteria cr = ses.createCriteria(DB.Invoice.class);
                                    cr.add(Restrictions.eq("user", u));
                                    cr.addOrder(Order.desc("invoiceId"));
                                    List<DB.Invoice> li = cr.list();
                                    for (DB.Invoice in : li) {
//                                            System.out.println(in.getInvoiceId());
                                        Criteria cr2 = ses.createCriteria(DB.InvoiceItems.class);
                                        cr2.add(Restrictions.eq("invoice", in));
                                        cr.addOrder(Order.desc("invoiceId"));
                                        List<DB.InvoiceItems> li1 = cr2.list();
                                        for (DB.InvoiceItems ins : li1) {


                                %>
                                <div class="col-md-12">
                                    <div class="row">
                                        <div class="col-md-6">
                                            <div class="row text-capitalize" style="margin-left: 42px;">order date</div>
                                            <div class="row " style="margin-left: 42px;"><%=in.getDate()%></div>
                                        </div>
                                        <div class="col-md-6">
                                            <div class="row text-capitalize text-center">Order Total</div>
                                            <div class="row text-center"><%=in.getTotalPrice()%></div>
                                        </div>
                                        <div class="row" style="margin-top: 10px;">
                                            <div class="col-md-2 text-center"><img src="<%=ins.getStock().getImage()%>" style="width: 70px; height: 70px;"></div>
                                            <div class="col-md-4 text-center">
                                                <div class="row"><h5><%=ins.getStock().getProductName()%></h5></div>
                                                <div class="row"><h6><%=ins.getStock().getDiscription()%></h6></div>
                                            </div>
                                            <div class="col-md-6" style="margin-top: 50px;">
                                                <div class="row text-capitalize text-center">item price</div>
                                                <div class="row text-center"><%=ins.getStock().getPrice()%></div>
                                            </div>
                                        </div>
                                    </div>
                                    <hr>
                                </div>
                                <%}
                                    }%>
                            </div>
                            <hr>
                        </div>
                        <div class="tab-pane fade" id="pruducts">
                            <div class="row text-center">
                                <div class="form" style="margin-top: 10px;">
                                    <div class="row">
                                        <div class="col-md-3"></div>
                                        <div class="col-md-6">
                                            <div class="col-md-12"><h3>Products</h3></div>
                                            <div class="col-md-12">
                                                <table class="table table-responsive table-bordered table-hover table-responsive">
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
                                                        Criteria cz = ses.createCriteria(DB.Stock.class);
                                                        cz.add(Restrictions.eq("user", (u)));
                                                        List<DB.Stock> lz = cz.list();

                                                        for (DB.Stock sz : lz) {
                                                    %>
                                                    <tr>
                                                        <td><img src="<%=sz.getImage()%>" width="70px;" height="70px"></td>
                                                        <td><%=sz.getProductName()%></td>

                                                        <td><%=sz.getPrice()%></td>
                                                        <%
                                                            int i = sz.getStatus();
                                                        %>
                                                        <%
                                                            if (i == 1) {
                                                        %>
                                                        <td>Active <span class="fa fa-check-circle text-success"></span></td>
                                                            <%} else if (i == 0) {%>
                                                        <td>Inactive <span class="fa fa-times-circle text-danger"></span></td>
                                                            <%
                                                                }
                                                                if (i == 1) {
                                                            %>
                                                        <td>Deactivate? <input type="checkbox" class="checkbox" onclick="activation(<%=sz.getStid()%>)"> <i class="fa fa-times-circle text-danger"></i></td>
                                                            <%} else if (i == 0) {%>
                                                        <td>Activate? <input type="checkbox" onclick="activation(<%=sz.getStid()%>)"> <i class="fa fa-check-circle text-success"></i></td>
                                                            <%}%>
                                                    </tr>
                                                    <%}%>
                                                </table>
                                            </div>
                                        </div>
                                        <div class="col-md-3" style="margin-top: 20px;">
                                            <%
                                                Criteria ci = ses.createCriteria(DB.Stock.class);
                                                cz.add(Restrictions.eq("user", (u)));
                                                List<DB.Stock> liz = cz.list();
                                                for (DB.Stock sz : liz) {
                                                    Criteria crz = ses.createCriteria(DB.Size.class);
                                                    crz.add(Restrictions.eq("stock", (sz)));
                                                    List<DB.Size> lis = crz.list();
                                                    for (DB.Size zz : lis) {
                                                        if (zz.getQty() < 3) {

                                            %>
                                            <kbd>You have low Quantity of <%=sz.getProductName()%> size of <%=zz.getSize()%>. Stock Id is <%=sz.getStid()%></kbd><br/>
                                            <%}
                                                    }
                                                }
                                            %>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="tab-pane fade" id="Stockupdate">
                            <div class="row">
                                <div class="col-md-12 text-center text-warning"><h3 style="margin-top: 10px;">Update Your Stock</h3></div>
                                <div class="col-md-3"></div>
                                <div class="col-md-6 text-center ">
                                    <div class="col-md-6"><input type="text" class="form-control" placeholder="Stock Id" id="sttid" required></div>
                                    <div class="col-md-6"><input type="text" class="form-control" placeholder="Size" id="sizez" required></div>
                                    <div class="col-md-6"><input type="text" class="form-control" placeholder="New qty" id="new" required></div>
                                    <button class="btn btn-info" onclick="updatestock()">Update</button>
                                    <div class="col-md-12" id="update">

                                    </div>
                                </div>
                                <div class="col-md-3"></div>
                            </div>
                        </div>
                        <div class="tab-pane fade" id="orders">
                            <div class="row">
                                <div class="col-md-12 text-center text-warning"><h3>Ordered Products</h3></div>
                                <div class="col-md-12">
                                    <table class="table table-hover table-responsive">
                                        <thead>
                                            <tr>
                                                <td>Image</td>
                                                <td>Product</td>
                                                <td>Quantity</td>
                                                <td>size</td>
                                                <td>Name</td>
                                                <td>Address</td>
                                                <td>Action</td>
                                            </tr>
                                        </thead>
                                        <%
                                            Criteria ctu = ses.createCriteria(DB.User.class);
                                            ctu.add(Restrictions.eq("uid", uss.getUid()));
                                            DB.User ussr = (User) ctu.uniqueResult();

                                            Criteria crt = ses.createCriteria(DB.Stock.class);
                                            crt.add(Restrictions.eq("user", ussr));
                                            List<DB.Stock> lol = crt.list();
                                            int ii = 0;
                                            for (DB.Stock st : lol) {
                                                System.out.println(st.getProductName());
                                                Criteria ct = ses.createCriteria(DB.Orders.class);
                                                int io = 0;

                                                ct.add(Restrictions.and(Restrictions.eq("status", io), Restrictions.eq("stock", st)));

                                                List<DB.Orders> or = ct.list();

                                                for (DB.Orders od : or) {
                                                    System.out.println(od.getUser());
                                                    Criteria cc = ses.createCriteria(DB.Address.class);
                                                    cc.add(Restrictions.eq("user", ussr));
                                                    List<DB.Address> aa = cc.list();
                                                    for (DB.Address ad : aa) {
                                                        System.out.println(od.getStock());

                                        %>
                                        <tr>
                                            <td><img src="<%=od.getStock().getImage()%>" class="img-circle img-responsive" width="70px;" height="70px;"></td>
                                            <td><%=od.getStock().getProductName()%></td>
                                            <td><%=od.getQty()%></td>
                                            <td><%=od.getSize()%></td>
                                            <td><%=od.getStock().getUser().getFname()%> <%=od.getStock().getUser().getLname()%></td>
                                            <td><%=ad.getAddress1()%>, <%=ad.getAddress2()%>, <%=ad.getCity().getCityname()%>, <%=ad.getDistrict().getDistrict()%>, <%=ad.getProvince().getProvince()%></td>
                                            <td><button class="btn btn-warning" onclick="deliver(<%=od.getOrderid()%>)">Deliver</button></td>
                                        </tr>
                                        <% }
                                                }
                                            }
                                        %>
                                    </table>
                                </div>
                            </div>
                        </div>
                        <div class="tab-pane fade" id="Porofit">
                            <div class="row">
                                <div class="col-md-12 text-center text-warning"><h3 style="margin-top: 10px;">Transaction</h3></div>
                                <div class="col-md-12">
                                    <table class="table table-hover table-responsive">
                                        <thead>
                                            <tr>
                                                <td>Image</td>
                                                <td>Product</td>
                                                <td>Buyer</td>
                                                <td>Price</td>
                                                <td>Quantity</td>
                                                <td>Total</td>
                                            </tr>
                                        </thead>
                                        <%
                                            Criteria crr = ses.createCriteria(DB.User.class);
                                            crr.add(Restrictions.eq("uid", uss.getUid()));
                                            DB.User uzr = (User) crr.uniqueResult();

                                            Criteria cri = ses.createCriteria(DB.Stock.class);
                                            cri.add(Restrictions.eq("user", uzr));
                                            List<DB.Stock> sttt = cri.list();
                                            int i = 0;
                                            for (DB.Stock syt : sttt) {

                                                Criteria ce = ses.createCriteria(DB.Orders.class);
                                                ce.add(Restrictions.eq("stock", syt));
                                                List<DB.Orders> lll = ce.list();
                                                for (DB.Orders oo : lll) {
                                        %>
                                        <tr>
                                            <td><img src="<%=oo.getStock().getImage()%>" class="img-rounded img-responsive" width="70px;" height="70px;"> </td>
                                            <td><%=oo.getStock().getProductName()%></td>
                                            <td><%=oo.getUser().getFname()%> <%=oo.getUser().getLname()%></td>
                                            <td><%=oo.getStock().getPrice()%></td>
                                            <td><%=oo.getQty()%></td>
                                            <td><%=oo.getStock().getPrice() * oo.getQty()%></td>

                                        </tr>
                                        <%
                                                    i += oo.getStock().getPrice() * oo.getQty();
                                                }
                                            }%>
                                    </table>
                                </div>
                                <div class="text-right"><h3>Total Income is <span class="text-danger"><%=i%>.00</span></h3> </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-md-1"></div>
        </div>

        <%}%>
    </body>
</html>
