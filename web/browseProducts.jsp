<%-- 
    Document   : browseProducts
    Created on : Oct 16, 2016, 11:04:14 PM
    Author     : Shanaka
--%>

<%@page import="DB.Size"%>
<%@page import="DB.Catagory"%>
<%@page import="DB.Stock"%>
<%@page import="org.hibernate.criterion.Restrictions"%>
<%@page import="connection.NewHibernateUtil"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Shoemart-Browse</title>
        <link rel="stylesheet" href="css/bootstrap.min_1.css">
        <link rel="stylesheet" href="css/custom.css">
        <link rel="stylesheet" href="css/font-awesome.min.css">
        <script src="js/jquery-3.1.0.min.js" type="text/javascript"></script>
        <script src="js/jquery.form.js" type="text/javascript"></script>
        <script src="js/progressBarScript.js" type="text/javascript"></script>
        <script src="js/bootstrap.min.js"></script>
        <script>
//            function women() {
//                var xhttp = new XMLHttpRequest();
//                xhttp.onreadystatechange = function() {
//                    if (xhttp.readyState === 4 && xhttp.status === 200) {
//                        document.getElementById("prudload").innerHTML = xhttp.responseText;
//                    }
//                };
//                xhttp.open("GET", "browse?women=women", true);
//                xhttp.send();
//            }

            $(document).ready(function() {
                $("#prudload").show(1000);

            });
        </script>
        <style type="text/css">
            #prudload{
                display: none;
            }
        </style>
    </head>
    <body id="background">
        <div class="row"></div>
        <div class="col-md-1"></div>
        <div class="col-md-10">
            <%@include file="header.jsp" %>
            <div class="row" style="margin-top: 50px">
                <div class="col-md-4">
                    <%@include file="leftdropdown.jsp" %>
                </div>

                <div class="col-md-8" id="sethere">
                    <div class="row" id="prudload">
                        <%
                            if (request.getParameter("map") != null && request.getParameter("map").equals("all")) {

                                Session ses = NewHibernateUtil.getSessionFactory().openSession();
                                Criteria cr = ses.createCriteria(DB.Stock.class);
                                List<Stock> l1 = cr.list();
                                for (Stock st1 : l1) {

                        %>
                        <div class="col-sm-6 col-md-3" style="text-align: center" id="eff">
                            <div class="thumbnail" style="background-color: #eee; border-radius: 20px; width: 170px; max-height:330px;">
                                <img src="<%=st1.getImage()%>" alt="shoes" style="border-radius: 20px;width: 170px;height: 150px;">
                                <div class="caption">
                                    <h3 id="pname"><%=st1.getProductName()%></h3>
                                    <p style="font-weight: bold;color:#ff3366 ">Rs. <%=st1.getPrice() %></p>
                                    <p><%=st1.getDiscription()%></p>
                                    <p><a  class="btn btn-success" role="button" id="adcrt" onclick="addtocart()">Buy Now</a></p>
                                </div>
                            </div>
                        </div> 
                        <%}
                            }%>


                        <%
                            if (request.getParameter("map") != null && request.getParameter("map").equals("women")) {

                                Session ses = NewHibernateUtil.getSessionFactory().openSession();
                                Criteria cr = ses.createCriteria(DB.Stock.class);
                                cr.add(Restrictions.eq("targetpop", "women"));
                                List<Stock> l1 = cr.list();
                                for (Stock st1 : l1) {

                        %>
                        <div class="col-sm-6 col-md-3" style="text-align: center">
                             <div class="thumbnail" style="background-color: #eee; border-radius: 20px; width: 170px; max-height:330px;">
                                <img src="<%=st1.getImage()%>" alt="shoes" style="border-radius: 20px;width: 170px;height: 150px;">
                                <div class="caption">
                                    <h3 id="pname"><%=st1.getProductName()%></h3>
                                    <p style="font-weight: bold;color:#ff3366 ">Rs. <%=st1.getPrice() %></p>
                                    <p><%=st1.getDiscription()%></p>
                                    <p><a  class="btn btn-success" role="button" id="adcrt" onclick="addtocart()">Buy Now</a></p>
                                </div>
                            </div>
                        </div> 
                        <%}
                            }%>


                        <%
                            if (request.getParameter("map") != null && request.getParameter("map").equals("men")) {

                                Session ses = NewHibernateUtil.getSessionFactory().openSession();
                                Criteria cr = ses.createCriteria(DB.Stock.class);
                                cr.add(Restrictions.eq("targetpop", "men"));
                                List<Stock> l1 = cr.list();
                                for (Stock st1 : l1) {

                        %>
                       <div class="col-sm-6 col-md-3" style="text-align: center">
                             <div class="thumbnail" style="background-color: #eee; border-radius: 20px; width: 170px; max-height:330px;">
                                <img src="<%=st1.getImage()%>" alt="shoes" style="border-radius: 20px;width: 170px;height: 150px;">
                                <div class="caption">
                                    <h3 id="pname"><%=st1.getProductName()%></h3>
                                    <p style="font-weight: bold;color:#ff3366 ">Rs. <%=st1.getPrice() %></p>
                                    <p><%=st1.getDiscription()%></p>
                                    <p><a  class="btn btn-success" role="button" id="adcrt" onclick="addtocart()">Buy Now</a></p>
                                </div>
                            </div>
                        </div> 
                        <%}
                            }%>


                        <%
                            if (request.getParameter("map") != null && request.getParameter("map").equals("girls")) {

                                Session ses = NewHibernateUtil.getSessionFactory().openSession();
                                Criteria cr = ses.createCriteria(DB.Stock.class);
                                cr.add(Restrictions.eq("targetpop", "girls"));
                                List<Stock> l1 = cr.list();
                                for (Stock st1 : l1) {

                        %>
                        <div class="col-sm-6 col-md-3" style="text-align: center">
                            <div class="thumbnail" style="background-color: #eee; border-radius: 20px; width: 170px; max-height:330px;">
                                <img src="<%=st1.getImage()%>" alt="shoes" style="border-radius: 20px;width: 170px;height: 150px;">
                                <div class="caption">
                                    <h3 id="pname"><%=st1.getProductName()%></h3>
                                    <p style="font-weight: bold;color:#ff3366 ">Rs. <%=st1.getPrice() %></p>
                                    <p><%=st1.getDiscription()%></p>
                                    <p><a  class="btn btn-success" role="button" id="adcrt" onclick="addtocart()">Buy Now</a></p>
                                </div>
                            </div>
                        </div> 
                        <%}
                            }%>


                        <%
                            if (request.getParameter("map") != null && request.getParameter("map").equals("boys")) {

                                Session ses = NewHibernateUtil.getSessionFactory().openSession();
                                Criteria cr = ses.createCriteria(DB.Stock.class);
                                cr.add(Restrictions.eq("targetpop", "boys"));
                                List<Stock> l1 = cr.list();
                                for (Stock st1 : l1) {

                        %>
                        <div class="col-sm-6 col-md-3" style="text-align: center">
                             <div class="thumbnail" style="background-color: #eee; border-radius: 20px; width: 170px; max-height:330px;">
                                <img src="<%=st1.getImage()%>" alt="shoes" style="border-radius: 20px;width: 170px;height: 150px;">
                                <div class="caption">
                                    <h3 id="pname"><%=st1.getProductName()%></h3>
                                    <p style="font-weight: bold;color:#ff3366 ">Rs. <%=st1.getPrice() %></p>
                                    <p><%=st1.getDiscription()%></p>
                                    <p><a  class="btn btn-success" role="button" id="adcrt" onclick="addtocart()">Buy Now</a></p>
                                </div>
                            </div>
                        </div> 
                        <%}
                            }%>

                        <%
                            if (request.getParameter("map") != null && request.getParameter("map").equals("boots")) {

                                Session ses = NewHibernateUtil.getSessionFactory().openSession();
                                Criteria cr = ses.createCriteria(DB.Stock.class);

                                Criteria cr1 = ses.createCriteria(DB.Catagory.class);
                                cr1.add(Restrictions.eq("catagoryId", 1));
                                Catagory ct = (Catagory) cr1.uniqueResult();

                                cr.add(Restrictions.eq("catagory", ct));
                                List<Stock> l1 = cr.list();
                                for (Stock st1 : l1) {

                        %>
                        <div class="col-sm-6 col-md-3" style="text-align: center">
                             <div class="thumbnail" style="background-color: #eee; border-radius: 20px; width: 170px; max-height:330px;">
                                <img src="<%=st1.getImage()%>" alt="shoes" style="border-radius: 20px;width: 170px;height: 150px;">
                                <div class="caption">
                                    <h3 id="pname"><%=st1.getProductName()%></h3>
                                    <p style="font-weight: bold;color:#ff3366 ">Rs. <%=st1.getPrice() %></p>
                                    <p><%=st1.getDiscription()%></p>
                                    <p><a  class="btn btn-success" role="button" id="adcrt" onclick="addtocart()">Buy Now</a></p>
                                </div>
                            </div>
                        </div> 
                        <%}
                            }%>


                        <%
                            if (request.getParameter("map") != null && request.getParameter("map").equals("laceups")) {

                                Session ses = NewHibernateUtil.getSessionFactory().openSession();
                                Criteria cr = ses.createCriteria(DB.Stock.class);

                                Criteria cr1 = ses.createCriteria(DB.Catagory.class);
                                cr1.add(Restrictions.eq("catagoryId", 2));
                                Catagory ct = (Catagory) cr1.uniqueResult();

                                cr.add(Restrictions.eq("catagory", ct));
                                List<Stock> l1 = cr.list();
                                for (Stock st1 : l1) {

                        %>
                       <div class="col-sm-6 col-md-3" style="text-align: center">
                             <div class="thumbnail" style="background-color: #eee; border-radius: 20px; width: 170px; max-height:330px;">
                                <img src="<%=st1.getImage()%>" alt="shoes" style="border-radius: 20px;width: 170px;height: 150px;">
                                <div class="caption">
                                    <h3 id="pname"><%=st1.getProductName()%></h3>
                                    <p style="font-weight: bold;color:#ff3366 ">Rs. <%=st1.getPrice() %></p>
                                    <p><%=st1.getDiscription()%></p>
                                    <p><a  class="btn btn-success" role="button" id="adcrt" onclick="addtocart()">Buy Now</a></p>
                                </div>
                            </div>
                        </div> 
                        <%}
                            }%>


                        <%
                            if (request.getParameter("map") != null && request.getParameter("map").equals("clogs")) {

                                Session ses = NewHibernateUtil.getSessionFactory().openSession();
                                Criteria cr = ses.createCriteria(DB.Stock.class);

                                Criteria cr1 = ses.createCriteria(DB.Catagory.class);
                                cr1.add(Restrictions.eq("catagoryId", 3));
                                Catagory ct = (Catagory) cr1.uniqueResult();

                                cr.add(Restrictions.eq("catagory", ct));
                                List<Stock> l1 = cr.list();
                                for (Stock st1 : l1) {

                        %>
                        <div class="col-sm-6 col-md-3" style="text-align: center">
                             <div class="thumbnail" style="background-color: #eee; border-radius: 20px; width: 170px; max-height:330px;">
                                <img src="<%=st1.getImage()%>" alt="shoes" style="border-radius: 20px;width: 170px;height: 150px;">
                                <div class="caption">
                                    <h3 id="pname"><%=st1.getProductName()%></h3>
                                    <p style="font-weight: bold;color:#ff3366 ">Rs. <%=st1.getPrice() %></p>
                                    <p><%=st1.getDiscription()%></p>
                                    <p><a  class="btn btn-success" role="button" id="adcrt" onclick="addtocart()">Buy Now</a></p>
                                </div>
                            </div>
                        </div> 
                        <%}
                            }%>


                        <%
                            if (request.getParameter("map") != null && request.getParameter("map").equals("runningshoe")) {

                                Session ses = NewHibernateUtil.getSessionFactory().openSession();
                                Criteria cr = ses.createCriteria(DB.Stock.class);

                                Criteria cr1 = ses.createCriteria(DB.Catagory.class);
                                cr1.add(Restrictions.eq("catagoryId", 4));
                                Catagory ct = (Catagory) cr1.uniqueResult();

                                cr.add(Restrictions.eq("catagory", ct));
                                List<Stock> l1 = cr.list();
                                for (Stock st1 : l1) {

                        %>
                        <div class="col-sm-6 col-md-3" style="text-align: center">
                             <div class="thumbnail" style="background-color: #eee; border-radius: 20px; width: 170px; max-height:330px;">
                                <img src="<%=st1.getImage()%>" alt="shoes" style="border-radius: 20px;width: 170px;height: 150px;">
                                <div class="caption">
                                    <h3 id="pname"><%=st1.getProductName()%></h3>
                                    <p style="font-weight: bold;color:#ff3366 ">Rs. <%=st1.getPrice() %></p>
                                    <p><%=st1.getDiscription()%></p>
                                    <p><a  class="btn btn-success" role="button" id="adcrt" onclick="addtocart()">Buy Now</a></p>
                                </div>
                            </div>
                        </div> 
                        <%}
                            }%>


                        <%
                            if (request.getParameter("map") != null && request.getParameter("map").equals("sandals")) {

                                Session ses = NewHibernateUtil.getSessionFactory().openSession();
                                Criteria cr = ses.createCriteria(DB.Stock.class);

                                Criteria cr1 = ses.createCriteria(DB.Catagory.class);
                                cr1.add(Restrictions.eq("catagoryId", 5));
                                Catagory ct = (Catagory) cr1.uniqueResult();

                                cr.add(Restrictions.eq("catagory", ct));
                                List<Stock> l1 = cr.list();
                                for (Stock st1 : l1) {

                        %>
                        <div class="col-sm-6 col-md-3" style="text-align: center">
                             <div class="thumbnail" style="background-color: #eee; border-radius: 20px; width: 170px; max-height:330px;">
                                <img src="<%=st1.getImage()%>" alt="shoes" style="border-radius: 20px;width: 170px;height: 150px;">
                                <div class="caption">
                                    <h3 id="pname"><%=st1.getProductName()%></h3>
                                    <p style="font-weight: bold;color:#ff3366 ">Rs. <%=st1.getPrice() %></p>
                                    <p><%=st1.getDiscription()%></p>
                                    <p><a  class="btn btn-success" role="button" id="adcrt" onclick="addtocart()">Buy Now</a></p>
                                </div>
                            </div>
                        </div> 
                        <%}
                            }%>

                        <%
                            if (request.getParameter("map") != null && request.getParameter("map").equals("slipon")) {

                                Session ses = NewHibernateUtil.getSessionFactory().openSession();
                                Criteria cr = ses.createCriteria(DB.Stock.class);

                                Criteria cr1 = ses.createCriteria(DB.Catagory.class);
                                cr1.add(Restrictions.eq("catagoryId", 6));
                                Catagory ct = (Catagory) cr1.uniqueResult();

                                cr.add(Restrictions.eq("catagory", ct));
                                List<Stock> l1 = cr.list();
                                for (Stock st1 : l1) {

                        %>
                       <div class="col-sm-6 col-md-3" style="text-align: center">
                             <div class="thumbnail" style="background-color: #eee; border-radius: 20px; width: 170px; max-height:330px;">
                                <img src="<%=st1.getImage()%>" alt="shoes" style="border-radius: 20px;width: 170px;height: 150px;">
                                <div class="caption">
                                    <h3 id="pname"><%=st1.getProductName()%></h3>
                                    <p style="font-weight: bold;color:#ff3366 ">Rs. <%=st1.getPrice() %></p>
                                    <p><%=st1.getDiscription()%></p>
                                    <p><a  class="btn btn-success" role="button" id="adcrt" onclick="addtocart()">Buy Now</a></p>
                                </div>
                            </div>
                        </div> 
                        <%}
                            }%>




                        <%
                            if (request.getParameter("map") != null && request.getParameter("map").equals("slippers")) {

                                Session ses = NewHibernateUtil.getSessionFactory().openSession();
                                Criteria cr = ses.createCriteria(DB.Stock.class);

                                Criteria cr1 = ses.createCriteria(DB.Catagory.class);
                                cr1.add(Restrictions.eq("catagoryId", 7));
                                Catagory ct = (Catagory) cr1.uniqueResult();

                                cr.add(Restrictions.eq("catagory", ct));
                                List<Stock> l1 = cr.list();
                                for (Stock st1 : l1) {

                        %>
                        <div class="col-sm-6 col-md-3" style="text-align: center">
                            <div class="thumbnail" style="background-color: #eee; border-radius: 20px; width: 170px; max-height:330px;">
                                <img src="<%=st1.getImage()%>" alt="shoes" style="border-radius: 20px;width: 170px;height: 150px;">
                                <div class="caption">
                                    <h3 id="pname"><%=st1.getProductName()%></h3>
                                    <p style="font-weight: bold;color:#ff3366 ">Rs. <%=st1.getPrice() %></p>
                                    <p><%=st1.getDiscription()%></p>
                                    <p><a  class="btn btn-success" role="button" id="adcrt" onclick="addtocart()">Buy Now</a></p>
                                </div>
                            </div>
                        </div> 
                        <%}
                            }%>





                        <%
                            if (request.getParameter("map") != null && request.getParameter("map").equals("sneakers")) {

                                Session ses = NewHibernateUtil.getSessionFactory().openSession();
                                Criteria cr = ses.createCriteria(DB.Stock.class);

                                Criteria cr1 = ses.createCriteria(DB.Catagory.class);
                                cr1.add(Restrictions.eq("catagoryId", 8));
                                Catagory ct = (Catagory) cr1.uniqueResult();

                                cr.add(Restrictions.eq("catagory", ct));
                                List<Stock> l1 = cr.list();
                                for (Stock st1 : l1) {

                        %>
                       <div class="col-sm-6 col-md-3" style="text-align: center">
                             <div class="thumbnail" style="background-color: #eee; border-radius: 20px; width: 170px; max-height:330px;">
                                <img src="<%=st1.getImage()%>" alt="shoes" style="border-radius: 20px;width: 170px;height: 150px;">
                                <div class="caption">
                                    <h3 id="pname"><%=st1.getProductName()%></h3>
                                    <p style="font-weight: bold;color:#ff3366 ">Rs. <%=st1.getPrice() %></p>
                                    <p><%=st1.getDiscription()%></p>
                                    <p><a  class="btn btn-success" role="button" id="adcrt" onclick="addtocart()">Buy Now</a></p>
                                </div>
                            </div>
                        </div> 
                        <%}
                            }%>


                        <%
                            if (request.getParameter("map") != null && request.getParameter("map").equals("28")) {

                                Session ses = NewHibernateUtil.getSessionFactory().openSession();
                                Criteria cr1 = ses.createCriteria(DB.Size.class);
                                cr1.add(Restrictions.eq("size", 28));
                                List<DB.Size> li = cr1.list();
                                for (Size sz : li) {
                                   
                        %>
                        <div class="col-sm-6 col-md-3" style="text-align: center">
                             <div class="thumbnail" style="background-color: #eee; border-radius: 20px; width: 170px; max-height:330px;">
                                <img src="<%=sz.getStock().getImage() %>" alt="shoes" style="border-radius: 20px;width: 170px;height: 150px;">
                                <div class="caption">
                                    <h3 id="pname"><%=sz.getStock().getProductName() %></h3>
                                    <p style="font-weight: bold;color:#ff3366 ">Rs. <%=sz.getStock().getPrice() %></p>
                                    <p><%=sz.getStock().getDiscription() %></p>
                                    <p><a  class="btn btn-success" role="button" id="adcrt" onclick="addtocart()">Buy Now</a></p>
                                </div>
                            </div>
                        </div> 
                        <%}
                                }
                            
                        %>


                        <%
                            if (request.getParameter("map") != null && request.getParameter("map").equals("29")) {

                                Session ses = NewHibernateUtil.getSessionFactory().openSession();
                                Criteria cr1 = ses.createCriteria(DB.Size.class);
                                cr1.add(Restrictions.eq("size", 29));
                                List<DB.Size> li = cr1.list();
                                for (Size sz : li) {
                                   
                        %>
                        <div class="col-sm-6 col-md-3" style="text-align: center">
                             <div class="thumbnail" style="background-color: #eee; border-radius: 20px; width: 170px; max-height:330px;">
                                <img src="<%=sz.getStock().getImage()%>" alt="shoes" style="border-radius: 20px;width: 170px;height: 150px;">
                                <div class="caption">
                                    <h3 id="pname"><%=sz.getStock().getProductName()%></h3>
                                    <p style="font-weight: bold;color:#ff3366 ">Rs. <%=sz.getStock().getPrice() %></p>
                                    <p><%=sz.getStock().getDiscription()%></p>
                                    <p><a  class="btn btn-success" role="button" id="adcrt" onclick="addtocart()">Buy Now</a></p>
                                </div>
                            </div>
                        </div> 
                        <%}
                                }
                            
                        %>

                        <%
                            if (request.getParameter("map") != null && request.getParameter("map").equals("30")) {

                                Session ses = NewHibernateUtil.getSessionFactory().openSession();
                                Criteria cr1 = ses.createCriteria(DB.Size.class);
                                cr1.add(Restrictions.eq("size", 30));
                                List<DB.Size> li = cr1.list();
                                for (Size sz : li) {
                                   
                        %>
                        <div class="col-sm-6 col-md-3" style="text-align: center">
                             <div class="thumbnail" style="background-color: #eee; border-radius: 20px; width: 170px; max-height:330px;">
                                <img src="<%=sz.getStock().getImage() %>" alt="shoes" style="border-radius: 20px;width: 170px;height: 150px;">
                                <div class="caption">
                                    <h3 id="pname"><%=sz.getStock().getProductName()%></h3>
                                    <p><%=sz.getStock().getDiscription()%></p>
                                    <p><a  class="btn btn-success" role="button" id="adcrt" onclick="addtocart()">Buy Now</a></p>
                                </div>
                            </div>
                        </div> 
                        <%}
                                }
                            
                        %>
                        
                        
                        
                        
                          <%
                            if (request.getParameter("map") != null && request.getParameter("map").equals("31")) {

                                Session ses = NewHibernateUtil.getSessionFactory().openSession();
                                Criteria cr1 = ses.createCriteria(DB.Size.class);
                                cr1.add(Restrictions.eq("size", 31));
                                List<DB.Size> li = cr1.list();
                                for (Size sz : li) {
                                   
                        %>
                        <div class="col-sm-6 col-md-3" style="text-align: center">
                             <div class="thumbnail" style="background-color: #eee; border-radius: 20px; width: 170px; max-height:330px;">
                                <img src="<%=sz.getStock().getImage() %>" alt="shoes" style="border-radius: 20px;width: 170px;height: 150px;">
                                <div class="caption">
                                    <h3 id="pname"><%=sz.getStock().getProductName()%></h3>
                                    <p><%=sz.getStock().getDiscription()%></p>
                                    <p><a  class="btn btn-success" role="button" id="adcrt" onclick="addtocart()">Buy Now</a></p>
                                </div>
                            </div>
                        </div> 
                        <%}
                                }
                            
                        %>
                        
                        <%
                            if (request.getParameter("map") != null && request.getParameter("map").equals("32")) {

                                Session ses = NewHibernateUtil.getSessionFactory().openSession();
                                Criteria cr1 = ses.createCriteria(DB.Size.class);
                                cr1.add(Restrictions.eq("size", 32));
                                List<DB.Size> li = cr1.list();
                                for (Size sz : li) {
                                   
                        %>
                        <div class="col-sm-6 col-md-3" style="text-align: center">
                             <div class="thumbnail" style="background-color: #eee; border-radius: 20px; width: 170px; max-height:330px;">
                                <img src="<%=sz.getStock().getImage() %>" alt="shoes" style="border-radius: 20px;width: 170px;height: 150px;">
                                <div class="caption">
                                    <h3 id="pname"><%=sz.getStock().getProductName()%></h3>
                                    <p><%=sz.getStock().getDiscription()%></p>
                                    <p><a  class="btn btn-success" role="button" id="adcrt" onclick="addtocart()">Buy Now</a></p>
                                </div>
                            </div>
                        </div> 
                        <%}
                                }
                            
                        %>
                        
                        
                        <%
                            if (request.getParameter("map") != null && request.getParameter("map").equals("33")) {

                                Session ses = NewHibernateUtil.getSessionFactory().openSession();
                                Criteria cr1 = ses.createCriteria(DB.Size.class);
                                cr1.add(Restrictions.eq("size", 33));
                                List<DB.Size> li = cr1.list();
                                for (Size sz : li) {
                                   
                        %>
                        <div class="col-sm-6 col-md-3" style="text-align: center">
                             <div class="thumbnail" style="background-color: #eee; border-radius: 20px; width: 170px; max-height:330px;">
                                <img src="<%=sz.getStock().getImage() %>" alt="shoes" style="border-radius: 20px;width: 170px;height: 150px;">
                                <div class="caption">
                                    <h3 id="pname"><%=sz.getStock().getProductName()%></h3>
                                    <p><%=sz.getStock().getDiscription()%></p>
                                    <p><a  class="btn btn-success" role="button" id="adcrt" onclick="addtocart()">Buy Now</a></p>
                                </div>
                            </div>
                        </div> 
                        <%}
                                }
                            
                        %>
                        
                        
                        
                        <%
                            if (request.getParameter("map") != null && request.getParameter("map").equals("34")) {

                                Session ses = NewHibernateUtil.getSessionFactory().openSession();
                                Criteria cr1 = ses.createCriteria(DB.Size.class);
                                cr1.add(Restrictions.eq("size", 34));
                                List<DB.Size> li = cr1.list();
                                for (Size sz : li) {
                                   
                        %>
                        <div class="col-sm-6 col-md-3" style="text-align: center">
                             <div class="thumbnail" style="background-color: #eee; border-radius: 20px; width: 170px; max-height:330px;">
                                <img src="<%=sz.getStock().getImage() %>" alt="shoes" style="border-radius: 20px;width: 170px;height: 150px;">
                                <div class="caption">
                                    <h3 id="pname"><%=sz.getStock().getProductName()%></h3>
                                    <p><%=sz.getStock().getDiscription()%></p>
                                    <p><a  class="btn btn-success" role="button" id="adcrt" onclick="addtocart()">Buy Now</a></p>
                                </div>
                            </div>
                        </div> 
                        <%}
                                }
                            
                        %>
                        
                        
                        <%
                            if (request.getParameter("map") != null && request.getParameter("map").equals("35")) {

                                Session ses = NewHibernateUtil.getSessionFactory().openSession();
                                Criteria cr1 = ses.createCriteria(DB.Size.class);
                                cr1.add(Restrictions.eq("size", 35));
                                List<DB.Size> li = cr1.list();
                                for (Size sz : li) {
                                   
                        %>
                        <div class="col-sm-6 col-md-3" style="text-align: center">
                             <div class="thumbnail" style="background-color: #eee; border-radius: 20px; width: 170px; max-height:330px;">
                                <img src="<%=sz.getStock().getImage() %>" alt="shoes" style="border-radius: 20px;width: 170px;height: 150px;">
                                <div class="caption">
                                    <h3 id="pname"><%=sz.getStock().getProductName()%></h3>
                                    <p><%=sz.getStock().getDiscription()%></p>
                                    <p><a  class="btn btn-success" role="button" id="adcrt" onclick="addtocart()">Buy Now</a></p>
                                </div>
                            </div>
                        </div> 
                        <%}
                                }
                            
                        %>
                        
                        <%
                            if (request.getParameter("map") != null && request.getParameter("map").equals("36")) {

                                Session ses = NewHibernateUtil.getSessionFactory().openSession();
                                Criteria cr1 = ses.createCriteria(DB.Size.class);
                                cr1.add(Restrictions.eq("size", 36));
                                List<DB.Size> li = cr1.list();
                                for (Size sz : li) {
                                   
                        %>
                        <div class="col-sm-6 col-md-3" style="text-align: center">
                             <div class="thumbnail" style="background-color: #eee; border-radius: 20px; width: 170px; max-height:330px;">
                                <img src="<%=sz.getStock().getImage() %>" alt="shoes" style="border-radius: 20px;width: 170px;height: 150px;">
                                <div class="caption">
                                    <h3 id="pname"><%=sz.getStock().getProductName()%></h3>
                                    <p><%=sz.getStock().getDiscription()%></p>
                                    <p><a  class="btn btn-success" role="button" id="adcrt" onclick="addtocart()">Buy Now</a></p>
                                </div>
                            </div>
                        </div> 
                        <%}
                                }
                            
                        %>
                        
                        
                        
                        <%
                            if (request.getParameter("map") != null && request.getParameter("map").equals("37")) {

                                Session ses = NewHibernateUtil.getSessionFactory().openSession();
                                Criteria cr1 = ses.createCriteria(DB.Size.class);
                                cr1.add(Restrictions.eq("size", 37));
                                List<DB.Size> li = cr1.list();
                                for (Size sz : li) {
                                   
                        %>
                        <div class="col-sm-6 col-md-3" style="text-align: center">
                             <div class="thumbnail" style="background-color: #eee; border-radius: 20px; width: 170px; max-height:330px;">
                                <img src="<%=sz.getStock().getImage() %>" alt="shoes" style="border-radius: 20px;width: 170px;height: 150px;">
                                <div class="caption">
                                    <h3 id="pname"><%=sz.getStock().getProductName()%></h3>
                                    <p><%=sz.getStock().getDiscription()%></p>
                                    <p><a  class="btn btn-success" role="button" id="adcrt" onclick="addtocart()">Buy Now</a></p>
                                </div>
                            </div>
                        </div> 
                        <%}
                                }
                            
                        %>
                        
                        
                        
                        <%
                            if (request.getParameter("map") != null && request.getParameter("map").equals("38")) {

                                Session ses = NewHibernateUtil.getSessionFactory().openSession();
                                Criteria cr1 = ses.createCriteria(DB.Size.class);
                                cr1.add(Restrictions.eq("size", 38));
                                List<DB.Size> li = cr1.list();
                                for (Size sz : li) {
                                   
                        %>
                        <div class="col-sm-6 col-md-3" style="text-align: center">
                             <div class="thumbnail" style="background-color: #eee; border-radius: 20px; width: 170px; max-height:330px;">
                                <img src="<%=sz.getStock().getImage() %>" alt="shoes" style="border-radius: 20px;width: 170px;height: 150px;">
                                <div class="caption">
                                    <h3 id="pname"><%=sz.getStock().getProductName()%></h3>
                                    <p><%=sz.getStock().getDiscription()%></p>
                                    <p><a  class="btn btn-success" role="button" id="adcrt" onclick="addtocart()">Buy Now</a></p>
                                </div>
                            </div>
                        </div> 
                        <%}
                                }
                            
                        %>
                        
                        
                        
                        
                        <%
                            if (request.getParameter("map") != null && request.getParameter("map").equals("39")) {

                                Session ses = NewHibernateUtil.getSessionFactory().openSession();
                                Criteria cr1 = ses.createCriteria(DB.Size.class);
                                cr1.add(Restrictions.eq("size", 39));
                                List<DB.Size> li = cr1.list();
                                for (Size sz : li) {
                                   
                        %>
                        <div class="col-sm-6 col-md-3" style="text-align: center">
                             <div class="thumbnail" style="background-color: #eee; border-radius: 20px; width: 170px; max-height:330px;">
                                <img src="<%=sz.getStock().getImage() %>" alt="shoes" style="border-radius: 20px;width: 170px;height: 150px;">
                                <div class="caption">
                                    <h3 id="pname"><%=sz.getStock().getProductName()%></h3>
                                    <p><%=sz.getStock().getDiscription()%></p>
                                    <p><a  class="btn btn-success" role="button" id="adcrt" onclick="addtocart()">Buy Now</a></p>
                                </div>
                            </div>
                        </div> 
                        <%}
                                }
                            
                        %>
                        
                        <%
                            if (request.getParameter("map") != null && request.getParameter("map").equals("40")) {

                                Session ses = NewHibernateUtil.getSessionFactory().openSession();
                                Criteria cr1 = ses.createCriteria(DB.Size.class);
                                cr1.add(Restrictions.eq("size", 40));
                                List<DB.Size> li = cr1.list();
                                for (Size sz : li) {
                                   
                        %>
                        <div class="col-sm-6 col-md-3" style="text-align: center">
                             <div class="thumbnail" style="background-color: #eee; border-radius: 20px; width: 170px; max-height:330px;">
                                <img src="<%=sz.getStock().getImage() %>" alt="shoes" style="border-radius: 20px;width: 170px;height: 150px;">
                                <div class="caption">
                                    <h3 id="pname"><%=sz.getStock().getProductName()%></h3>
                                    <p><%=sz.getStock().getDiscription()%></p>
                                    <p><a  class="btn btn-success" role="button" id="adcrt" onclick="addtocart()">Buy Now</a></p>
                                </div>
                            </div>
                        </div> 
                        <%}
                                }
                            
                        %>
                        
                        
                        
                        <%
                            if (request.getParameter("map") != null && request.getParameter("map").equals("41")) {

                                Session ses = NewHibernateUtil.getSessionFactory().openSession();
                                Criteria cr1 = ses.createCriteria(DB.Size.class);
                                cr1.add(Restrictions.eq("size", 41));
                                List<DB.Size> li = cr1.list();
                                for (Size sz : li) {
                                   
                        %>
                        <div class="col-sm-6 col-md-3" style="text-align: center">
                             <div class="thumbnail" style="background-color: #eee; border-radius: 20px; width: 170px; max-height:330px;">
                                <img src="<%=sz.getStock().getImage() %>" alt="shoes" style="border-radius: 20px;width: 170px;height: 150px;">
                                <div class="caption">
                                    <h3 id="pname"><%=sz.getStock().getProductName()%></h3>
                                    <p><%=sz.getStock().getDiscription()%></p>
                                    <p><a  class="btn btn-success" role="button" id="adcrt" onclick="addtocart()">Buy Now</a></p>
                                </div>
                            </div>
                        </div> 
                        <%}
                                }
                            
                        %>
                        
                        
                        
                        <%
                            if (request.getParameter("map") != null && request.getParameter("map").equals("42")) {

                                Session ses = NewHibernateUtil.getSessionFactory().openSession();
                                Criteria cr1 = ses.createCriteria(DB.Size.class);
                                cr1.add(Restrictions.eq("size", 42));
                                List<DB.Size> li = cr1.list();
                                for (Size sz : li) {
                                   
                        %>
                        <div class="col-sm-6 col-md-3" style="text-align: center">
                             <div class="thumbnail" style="background-color: #eee; border-radius: 20px; width: 170px; max-height:330px;">
                                <img src="<%=sz.getStock().getImage() %>" alt="shoes" style="border-radius: 20px;width: 170px;height: 150px;">
                                <div class="caption">
                                    <h3 id="pname"><%=sz.getStock().getProductName()%></h3>
                                    <p><%=sz.getStock().getDiscription()%></p>
                                    <p><a  class="btn btn-success" role="button" id="adcrt" onclick="addtocart()">Buy Now</a></p>
                                </div>
                            </div>
                        </div> 
                        <%}
                                }
                            
                        %>
                        
                        
                        
                        <%
                            if (request.getParameter("map") != null && request.getParameter("map").equals("43")) {

                                Session ses = NewHibernateUtil.getSessionFactory().openSession();
                                Criteria cr1 = ses.createCriteria(DB.Size.class);
                                cr1.add(Restrictions.eq("size", 43));
                                List<DB.Size> li = cr1.list();
                                for (Size sz : li) {
                                   
                        %>
                        <div class="col-sm-6 col-md-3" style="text-align: center">
                             <div class="thumbnail" style="background-color: #eee; border-radius: 20px; width: 170px; max-height:330px;">
                                <img src="<%=sz.getStock().getImage() %>" alt="shoes" style="border-radius: 20px;width: 170px;height: 150px;">
                                <div class="caption">
                                    <h3 id="pname"><%=sz.getStock().getProductName()%></h3>
                                    <p><%=sz.getStock().getDiscription()%></p>
                                    <p><a  class="btn btn-success" role="button" id="adcrt" onclick="addtocart()">Buy Now</a></p>
                                </div>
                            </div>
                        </div> 
                        <%}
                                }
                            
                        %>
                        
                        
                        
                        <%
                            if (request.getParameter("map") != null && request.getParameter("map").equals("44")) {

                                Session ses = NewHibernateUtil.getSessionFactory().openSession();
                                Criteria cr1 = ses.createCriteria(DB.Size.class);
                                cr1.add(Restrictions.eq("size", 44));
                                List<DB.Size> li = cr1.list();
                                for (Size sz : li) {
                                   
                        %>
                        <div class="col-sm-6 col-md-3" style="text-align: center">
                             <div class="thumbnail" style="background-color: #eee; border-radius: 20px; width: 170px; max-height:330px;">
                                <img src="<%=sz.getStock().getImage() %>" alt="shoes" style="border-radius: 20px;width: 170px;height: 150px;">
                                <div class="caption">
                                    <h3 id="pname"><%=sz.getStock().getProductName()%></h3>
                                    <p><%=sz.getStock().getDiscription()%></p>
                                    <p><a  class="btn btn-success" role="button" id="adcrt" onclick="addtocart()">Buy Now</a></p>
                                </div>
                            </div>
                        </div> 
                        <%}
                                }
                            
                        %>
                        
                    </div>
                </div>

            </div>
            <div class="col-md-1"></div>
            
                <div class="col-md-12">
                    <%@include file="footer.jsp" %>                   
                
            </div>
    </body>
</html>
