<%-- 
    Document   : createAnAccount
    Created on : Sep 8, 2016, 5:41:27 PM
    Author     : Shanaka
--%>

<%@page import="DB.UserType"%>
<%@page import="java.util.List"%>
<%@page import="org.hibernate.Criteria"%>
<%@page import="org.hibernate.Session"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Create An Account</title>
        <link rel="stylesheet" href="css/bootstrap.min.css">
        <link rel="stylesheet" href="css/custom.css">
    </head>
    <body class="signup">
        <div class="row">
            <div class="col-md-6" style="margin-top: 240px; text-align: center">
                <div class="col-md-12"><center><img src="img/logo.png" class="img-responsive"></center></div>
                <div class="col-sm-12"><h4 style="color: whitesmoke; font-family: cursive">Online Shoe Mart is the most suitable place for any human being to buy there shoes in one place. We produce you a very fast delivery and most secured products for your every penny.</h4></div>
            </div>
            <div class="col-md-6">
                <div class="panel-body" style="border: 1px solid #666666; margin-top: 80px; margin-right: 10px;">
                    <h2 style="margin-bottom: 40px; margin-left: 20px; font-family:initial; color: skyblue">Sign Up</h2>
                    <hr style="background-color:#666666;">
                    <form class="form" action="user" method="post" id="regForm" onsubmit="return sub()">
                        <div class="col-sm-6"><input type="text" id="fname" class="form-control" placeholder="First Name" name="fname" required></div>
                        <div class="col-sm-6"><input type="text" id="lname" class="form-control" placeholder="Last Name" name="lname" required></div>
                        <div class="col-sm-12"><input type="email" id="email" class="form-control" placeholder="Email" name="email" required></div>
                        <div class="col-sm-6"><input type="password" id="pass1" class="form-control" placeholder="Password" name="pword" required></div>
                        <div class="col-sm-6"><input type="password" id="pass2" class="form-control" placeholder="Password Again" name="retrypword"  id="inputSuccess" required></div>

                        <div class="col-sm-6"><input type="number" class="form-control" placeholder="Telephone Number" name="tpnumber" required></div>
                        <div class="col-sm-6">
                            <div class="form-group">
                                <label for="sel1">Which are you? (select one):</label>
                                <select class="form-control" id="sel1" name="who">
                                    <%
                                        Session ses = connection.NewHibernateUtil.getSessionFactory().openSession();
                                        Criteria cr = ses.createCriteria(DB.UserType.class);
                                        List<DB.UserType> loadType = cr.list();
                                        for (UserType ut : loadType) {
                                    %>
                                    <option>I'm a <%=ut.getUserType()%></option>
                                    <%}%>
                                </select>
                            </div>
                        </div>
                        <div class="col-sm-6"><small><strong>We never share your Email or Telephone number for any advertising purpose.</strong></small></div>
                        <div class="col-sm-6"><input type="submit" class="btn btn-success" value="Sign Up"></div>  
                        <script>
                            function sub() {
                                var pass1 = document.getElementById("pass1").value;
                                var pass2 = document.getElementById("pass2").value;
                                var fname = document.getElementById("fname").value;
                                var lname = document.getElementById("lname").value;
                                var email = document.getElementById("email").value;

                                if (fname === null || fname === "", lname === null || lname === "", email === null || email === "", pass1 === null || pass1 === "", pass2 === null || pass2 === "") {
                                    alert("Please Fill All Required Fields");
                                    return false;

                                } else {
                                    if (pass1 !== pass2) {
                                        document.getElementById("pass1").style.borderColor = "#E34234";
                                        document.getElementById("pass2").style.borderColor = "#E34234";
                                        return false;
                                    }
                                }

                            }
                        </script>


                    </form>

                    <div class="col-sm-12"><small>By clicking 'Sign Up', you agree to the <a href="#">Terms and Conditions</a> set out by this site, including our <a>Privacy Policy</a>.</small></div>
                </div>
                <div class="col-sm-5" style="margin-top: 30px; border: 1px solid #666666; padding: 10px;"> Already have an account? <input type="button" class="btn btn-primary" value="Sign In" onclick="location.href = 'login.jsp'"></div>         
            </div>
        </div>





        <script src="js/jquery-3.1.0.min.js"></script>       
        <script src="js/bootstrap.min.js"></script>     
    </body>
</html>
