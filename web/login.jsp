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
        <script src="js/jquery-3.1.0.min.js"></script>       
        <script src="js/bootstrap.min.js"></script>   

        <style>
            html {
                width: 100%;
                height: 100%;
                box-sizing: border-box;

            }

            *,
            *:before,
            *:after {
                box-sizing: inherit;
            }

            body {
                width: 100%;
                height: 100%;
                font: 100px/100px "Helvetica Neue";
                font-weight: 900;
                color: rgba(255, 255, 255, 1);
                -webkit-font-smoothing: antialiased;
                font-smoothing: antialiased;
                overflow: hidden;
            }

            .child {
                position: absolute;
                top: 50%;
                left: 50%;
                transform: translate(-50%, -50%);

            }
            svg {
                width:100%;
                height: 100%;
            }

        </style>
    </head>
    <body class="signin">
        <!--        <div>
                      <svg viewBox="0 0 100 100" preserveAspectRatio="xMidYMid slice">
                <defs>
                <radialGradient id="Gradient1" cx="50%" cy="50%" fx="50%" fy="50%" r=".5">
                <animate attributeName="fx" dur="34s" values="0%;5%;0%" repeatCount="indefinite" />
                <stop offset="0%" stop-color="rgba(255, 0, 255, 1)" />
                <stop offset="100%" stop-color="rgba(255, 0, 255, 0)" />
                </radialGradient>
                <radialGradient id="Gradient2" cx="50%" cy="50%" fx="10%" fy="50%" r=".5">
                <animate attributeName="fx" dur="23.5s" values="0%;5%;0%" repeatCount="indefinite" />
                <stop offset="0%" stop-color="rgba(255, 255, 0, 1)" />
                <stop offset="100%" stop-color="rgba(255, 255, 0, 0)" />
                </radialGradient>
                <radialGradient id="Gradient3" cx="50%" cy="50%" fx="50%" fy="50%" r=".5">
                <animate attributeName="fx" dur="21.5s" values="0%;5%;0%" repeatCount="indefinite" />
                <stop offset="0%" stop-color="rgba(0, 255, 255, 1)" />
                <stop offset="100%" stop-color="rgba(0, 255, 255, 0)" />
                </radialGradient>
        
                <radialGradient id="Gradient4" cx="50%" cy="50%" fx="50%" fy="50%" r=".5">
                <animate attributeName="fx" dur="23s" values="0%;5%;0%" repeatCount="indefinite" />
                <stop offset="0%" stop-color="rgba(0, 255, 0, 1)" />
                <stop offset="100%" stop-color="rgba(0, 255, 0, 0)" />
                </radialGradient>
                <radialGradient id="Gradient5" cx="50%" cy="50%" fx="10%" fy="50%" r=".5">
                <animate attributeName="fx" dur="24.5s" values="0%;5%;0%" repeatCount="indefinite" />
                <stop offset="0%" stop-color="rgba(0,0,255, 1)" />
                <stop offset="100%" stop-color="rgba(0,0,255, 0)" />
                </radialGradient>
                <radialGradient id="Gradient6" cx="50%" cy="50%" fx="50%" fy="50%" r=".5">
                <animate attributeName="fx" dur="25.5s" values="0%;5%;0%" repeatCount="indefinite" />
                <stop offset="0%" stop-color="rgba(255,0,0, 1)" />
                <stop offset="100%" stop-color="rgba(255,0,0, 0)" />
                </radialGradient>
                </defs>
        
                <rect x="0" y="0" width="100%" height="100%" fill="url(#Gradient4)">
                <animate attributeName="x" dur="20s" values="25%;0%;25%" repeatCount="indefinite" />
                <animate attributeName="y" dur="21s" values="0%;25%;0%" repeatCount="indefinite" />
                <animateTransform attributeName="transform" type="rotate" from="0 50 50" to="360 50 50" dur="17s" repeatCount="indefinite"/>
                </rect>
                <rect x="0" y="0" width="100%" height="100%" fill="url(#Gradient5)">
                <animate attributeName="x" dur="23s" values="0%;-25%;0%" repeatCount="indefinite" />
                <animate attributeName="y" dur="24s" values="25%;-25%;25%" repeatCount="indefinite" />
                <animateTransform attributeName="transform" type="rotate" from="0 50 50" to="360 50 50" dur="18s" repeatCount="indefinite"/>
                </rect>
                <rect x="0" y="0" width="100%" height="100%" fill="url(#Gradient6)">
                <animate attributeName="x" dur="25s" values="-25%;0%;-25%" repeatCount="indefinite" />
                <animate attributeName="y" dur="26s" values="0%;-25%;0%" repeatCount="indefinite" />
                <animateTransform attributeName="transform" type="rotate" from="360 50 50" to="0 50 50" dur="19s" repeatCount="indefinite"/>
                </rect>
        
                <rect x="0" y="0" width="100%" height="100%" fill="url(#Gradient1)">
                <animate attributeName="x" dur="20s" values="0%;25%;0%" repeatCount="indefinite" />
                <animate attributeName="y" dur="21s" values="0%;25%;0%" repeatCount="indefinite" />
                <animateTransform attributeName="transform" type="rotate" from="0 50 50" to="360 50 50" dur="17s" repeatCount="indefinite"/>
                </rect>
                <rect x="0" y="0" width="100%" height="100%" fill="url(#Gradient2)">
                <animate attributeName="x" dur="23s" values="0%;-25%;0%" repeatCount="indefinite" />
                <animate attributeName="y" dur="24s" values="0%;-25%;0%" repeatCount="indefinite" />
                <animateTransform attributeName="transform" type="rotate" from="0 50 50" to="360 50 50" dur="18s" repeatCount="indefinite"/>
                </rect>
                <rect x="0" y="0" width="100%" height="100%" fill="url(#Gradient3)">
                <animate attributeName="x" dur="25s" values="0%;-25%;0%" repeatCount="indefinite" />
                <animate attributeName="y" dur="26s" values="0%;25%;0%" repeatCount="indefinite" />
                <animateTransform attributeName="transform" type="rotate" from="360 50 50" to="0 50 50" dur="19s" repeatCount="indefinite"/>
                </rect>
                </svg>-->

    </div>
    <div class="child">
        <div class="row" >
            <div class="col-md-6" style="margin-top: 240px; text-align: center">
                <div class="col-md-12"><center><a href="index.jsp"><img src="img/logo.png" class="img-responsive"></a></center></div>
                <div class="col-sm-12"><h4 style="color: whitesmoke; font-family: cursive">Online Shoe Mart is the most suitable place for any human being to buy there shoes in one place. We produce you a very fast delivery and most secured products for your every penny.</h4></div>
            </div>

            <div class="col-md-5" style="margin-top: 100px; border: 1px solid #666666; margin-bottom: 10px; padding-bottom: 10px;" >
                <form class="form" action="login" method="post">
                    <div>
                        <h2>Sign In</h2>
                        <hr>
                        <div class="col-md-8"><input type="text" class="form-control" placeholder="User Name" name="uname"></div>
                        <div class="col-md-8"><input type="password" class="form-control" placeholder="Password" name="pass"></div>
                        <input type="hidden" value="signin" name="logfrom">
                        <div class="col-md-6">
                            <div class="checkbox">
                                <label style="font-size:15px;"><input type="checkbox" name="remember">RememberMe</label>

                            </div>
                        </div>
                        <div class="col-md-5"><input type="submit" value="Login" name="type" class="btn btn-success"></div>

                    </div>
                </form>
                <div>
                    <div class="col-md-5"><a><img src="img/facebook-login.png" class="img-responsive"></a></div>
                    <div class="col-md-5"><a><img src="img/google-plus-login.png" class="img-responsive"></a></div>
                </div>
            </div>
        </div>
    </div>
</body>
</html>
