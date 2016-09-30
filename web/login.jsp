<%-- 
    Document   : login
    Created on : Sep 9, 2016, 2:48:49 PM
    Author     : Shanaka
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="css/bootstrap.min.css">
        <link rel="stylesheet" href="css/custom.css">
    </head>
    <body class="signin">
        <div class="row" >
            <div class="col-md-6" style="margin-top: 240px; text-align: center">
                <div class="col-md-12"><center><img src="img/logo.png" class="img-responsive"></center></div>
                <div class="col-sm-12"><h4 style="color: whitesmoke; font-family: cursive">Online Shoe Mart is the most suitable place for any human being to buy there shoes in one place. We produce you a very fast delivery and most secured products for your every penny.</h4></div>
            </div>

            <div class="col-md-5" style="margin-top: 100px; border: 1px solid #666666; margin-bottom: 10px; padding-bottom: 10px;" >
                <form class="form">
                    <div>
                        <h2>Sign In</h2>
                        <hr>
                        <div class="col-md-8"><input type="text" class="form-control" placeholder="User Name"></div>
                        <div class="col-md-8"><input type="password" class="form-control" placeholder="Password"></div>
                        <div class="checkbox col-md-6">
                            <label><input type="checkbox" name="remember">Remember Me</label>
                        </div>
                        <div class="col-md-5"><input type="submit" value="Login" class="btn btn-success"></div>

                    </div>
                </form>
                <div>
                    <div class="col-md-5"><a><img src="img/facebook-login.png" class="img-responsive"></a></div>
                    <div class="col-md-5"><a><img src="img/google-plus-login.png" class="img-responsive"></a></div>
                </div>
            </div>


        </div>






        <script src="js/jquery-3.1.0.min.js"></script>       
        <script src="js/bootstrap.min.js"></script>   
    </body>
</html>
