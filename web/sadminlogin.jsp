<%-- 
    Document   : sadminlogin
    Created on : Dec 15, 2016, 2:32:33 PM
    Author     : Shanaka
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="css/sadmin.css" rel="stylesheet">
        <link rel="stylesheet" href="css/bootstrap.min_1.css">
        <link rel="stylesheet" href="css/custom.css">
        <script src="js/jquery-3.1.0.min.js" type="text/javascript"></script>
        <script src="js/jquery.form.js" type="text/javascript"></script>
        <script src="js/progressBarScript.js" type="text/javascript"></script>
        <script src="js/bootstrap.min.js"></script>

        <script type="text/javascript">

            function loginadd(){
                
                var type = "SuperAdmin";
                var uname = document.getElementById("uname").value;
                var pword = document.getElementById("pword").value;
                
                var xhttp = new XMLHttpRequest();
                xhttp.onreadystatechange = function() {
                    if (xhttp.readyState === 4 && xhttp.status === 200) {
                        window.location.href = "admin.jsp";
                    }
                };
                xhttp.open("GET", "admin?type=" + type + "&uname=" + uname + "&pword=" +pword, true);
                xhttp.send();

            }
           


        </script>
    </head>
    <body>
        <%
            if(request.getSession().getAttribute("admin") != null){
                response.sendRedirect("admin.jsp");
            }else{
        %>
        <div class="container">
            <div class="card card-container">
                <!-- <img class="profile-img-card" src="//lh3.googleusercontent.com/-6V8xOA6M7BA/AAAAAAAAAAI/AAAAAAAAAAA/rzlHcD0KYwo/photo.jpg?sz=120" alt="" /> -->
                <img id="profile-img" class="profile-img-card fa fa-user" src="//ssl.gstatic.com/accounts/ui/avatar_2x.png" />
                <p id="profile-name" class="profile-name-card"></p>

                <span id="reauth-email" class="reauth-email"></span>
                <input type="email" class="form-control" placeholder="User name" required autofocus id="uname"> 
                <input type="password"  class="form-control" placeholder="Password" required id="pword">
                <div id="remember" class="checkbox">
                    <label>
                        <!--                            <input type="checkbox" value="remember-me"> Remember Me-->
                    </label>
                </div>
                <button class="btn btn-lg btn-success btn-block btn-signin" onclick="loginadd()">Login</button>
                <!--<button onclick="loginadd()">asd</button>-->
                <!-- /form -->

            </div><!-- /card-container -->
        </div><!-- /container -->
        <%}%>
    </body>
</html>

