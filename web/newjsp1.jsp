<%-- 
    Document   : newjsp1
    Created on : Dec 18, 2016, 3:33:51 AM
    Author     : Shanaka
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <script>
            function ad(){
                var as = document.getElementById("as").value;
                alert(as);
            }
            
        </script>
    </head>
    <body>
        <h1>Hello World!</h1>
        <input type="password" id="as">
        <button onclick="ad()">asd</button>
    </body>
</html>
