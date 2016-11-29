<%-- 
    Document   : wishlist
    Created on : Oct 24, 2016, 1:27:05 PM
    Author     : Shanaka
--%>

<%@page import="org.hibernate.criterion.Restrictions"%>
<%@page import="DB.Wishlist"%>
<%@page import="connection.NewHibernateUtil"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Wish List-ShoeMart</title>
    </head>
    <body id="background">
        <%
            if (request.getSession().getAttribute("user") == null) {
                response.sendRedirect("login.jsp");
            }
        %>
        <div class="row">
            <div class="col-md-1"></div>
            <div class="col-md-10">
                <div class="row">
                    <div class="col-md-12">
                        <%@include file="header.jsp" %>
                    </div>
                </div>
                <div class="row text-center">
                    <h3>Welcome to Wish List!</h3>
                    <p>In here you can see what have you saved to buy later...</p>
                </div>
                <div class="row">
                    <%
                        Session ses = NewHibernateUtil.getSessionFactory().openSession();

                        DB.User us = (DB.User) request.getSession().getAttribute("user");
                        int uid = us.getUid();
                        Criteria cr1 = ses.createCriteria(DB.User.class);
                        cr1.add(Restrictions.eq("uid", uid));
                        DB.User u = (DB.User) cr1.uniqueResult();

                        Criteria cr = ses.createCriteria(Wishlist.class);
                        cr.add(Restrictions.eq("user", u));
                        List<Wishlist> li = cr.list();
                        for (Wishlist wl : li) {


                    %>

                    <div class="col-sm-6 col-md-3" style="text-align: center">
                        <div class="thumbnail" style="background-color: #eee; border-radius: 20px; width: 250px; height: 370px;">
                            <img src="<%=wl.getStock().getImage()%>" alt="shoes" style="border-radius: 20px; width: 240px;height: 200px;">
                            <div class="caption">
                                <h3 id="pname"><%=wl.getStock().getProductName()%></h3>
                                <p style="font-weight: bold;color:#ff3366 ">Rs.<%=wl.getStock().getPrice()%></p>
                                <p><%=wl.getStock().getDiscription()%></p>
                                <div>
                                    <p><a  class="btn btn-success text-right" role="button" id="adcrt" data-toggle="modal" data-target="#myModal">Buy Now</a></p>   
                                </div>
                            </div>
                        </div>
                    </div>  
                    <%
                        }
                    %>
                </div>
            </div>
            <div class="col-md-1"></div>
        </div>
        <div class="row">
            <div class="col-md-12">
                <%@include file="footer.jsp" %>
            </div>
        </div>
    </body>
</html>
