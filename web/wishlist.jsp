<%-- 
    Document   : wishlist
    Created on : Oct 24, 2016, 1:27:05 PM
    Author     : Shanaka
--%>

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
            if(request.getSession().getAttribute("user")== null){
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
                    <div class="row">
                        <div class="">
                            <%
                                Session ses = NewHibernateUtil.getSessionFactory().openSession();
                                Criteria cr = ses.createCriteria(DB.Stock.class);
                                
                            %>
                            <table>
                                <thead>
                                    <tr>
                                        <td colspan="6">Seller : </td>
                                    </tr>
                                </thead>
                            </table>
                        </div>
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
