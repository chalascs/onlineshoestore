<%-- 
    Document   : addproducts
    Created on : Sep 22, 2016, 11:13:56 PM
    Author     : Shanaka
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="SizePojo.Model"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Add products</title>
        <link rel="stylesheet" href="css/bootstrap.min_1.css">
        <link rel="stylesheet" href="css/custom.css">
        <script src="js/jquery.js" type="text/javascript"></script>
        <script src="js/jquery.form.js" type="text/javascript"></script>
        <script src="js/progressBarScript.js" type="text/javascript"></script>

        <style>
            .topbar li a{
                color: white;
            }
            .topbar li{
                color: whitesmoke;
            }
        </style>
        <style type="text/css">
            #progressBox{
                width: 500px;
                height: auto;
            }
            #fileName{
                width: 304px;
            }
            #upFile{
                position: relative;
                overflow: hidden;
                margin: 10px;
            }
            .upload{
                opacity: 0;
                cursor: pointer;
                top: 0;
                right: 0;
                margin: 0;
                padding: 0;
                position: absolute;
            }
            .myimgs{
                margin-left: 10px;
                margin-top: 10px;
                cursor: pointer;
            }

        </style>

        <script type="text/javascript">
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


        </script>
        <!--add to table fuction-->
        <script>
            function addtable() {

                var xhttp = new XMLHttpRequest();
                var size = document.getElementById("size").value;
                var qty = document.getElementById("qty").value;
                xhttp.onreadystatechange = function() {
                    if (xhttp.readyState === 4 && xhttp.status === 200) {
                        document.getElementById("tab").innerHTML = xhttp.responseText;
                        document.getElementById("size").value = "";
                        document.getElementById("qty").value = "";
                    }
                };
                if (size !== "" && qty !== "") {

                    xhttp.open("GET", "addtotable?size=" + size + "&qty=" + qty + "&type=AddItem", true);
                    xhttp.send();
                }
            }

            function removeSize() {
                alert("vale");
                var xhttp = new XMLHttpRequest();

                xhttp.onreadystatechange = function() {
                    if (xhttp.readyState === 4 && xhttp.status === 200) {
                        document.getElementById("tab").innerHTML = xhttp.responseText;

                    }
                };
                xhttp.open("GET", "addtotable?type=removeItem", true);
                xhttp.send();

            }
            function abc(val) {
                var xhttp = new XMLHttpRequest();

                xhttp.onreadystatechange = function() {
                    if (xhttp.readyState === 4 && xhttp.status === 200) {
                        document.getElementById("tab").innerHTML = xhttp.responseText;

                    }
                };
                xhttp.open("GET", "addtotable?removeSize=" + val + "&type=removeItem", true);
                xhttp.send();
            }

        </script>
    </head>


    <body id="addproduct">
        <div class="col-md-1"></div>
        <div class="col-md-10">
            <div class="row">
                <div>
                    <%@include file="header.jsp" %>
                </div>
            </div>
            <div class="row">
                <div class="col-md-12"><center><label class="h2 text-uppercase" style="color: white">Add Products to sell</label></center></div>
            </div>
            <div class="row" style="margin-top: 10px;">


                <div class="col-md-6 form">


                    <div class="col-md-8"><input type="text" class="form-control" placeholder="Product ID"></div>
                    <div class="col-md-8"><input type="text" class="form-control" placeholder="Product Name"></div>
                    <div class="col-md-8"><input type="text" class="form-control" placeholder="Enter Price"></div>
                    <div class="col-md-8">
                        <label class="">Select your targeted population</label>
                        <div class="row">
                            <div class="col-md-5">
                                <div class="radio"><label><input type="radio" name="optradio" value="women">Women</label></div>
                                <div class=" radio"><label><input type="radio" name="optradio" value="men">Men</label></div>
                            </div>
                            <div class="col-md-6 ">
                                <div class=" radio"><label><input type="radio" name="optradio" value="girls">Girls</label></div>
                                <div class=" radio"><label><input type="radio" name="optradio" value="boys">Boys</label></div>
                            </div>
                        </div>
                    </div>

                    <div class="form-group col-md-8">
                        <label for="gender">Which type is your product?</label>
                        <select class="form-control" id="gender">
                            <option>Boots</option>
                            <option>Lace-ups</option>
                            <option>Clogs & Mules</option>
                            <option>Running shoes</option>
                            <option>Sandals</option>
                            <option>Slip-ons</option>
                            <option>Slippers</option>
                            <option>Sneakers</option>
                        </select>
                    </div>
                    <div class="col-md-8"><textarea class="form-control" placeholder="Product Discription (This will show below the product)"></textarea></div>
                    <div class="col-md-8"><input type="text" class="form-control" placeholder="Discount(%)"></div>


                </div>


                <div class="col-md-6">

                    <div class="col-md-8 row">
                        <label>Sizes & Quantity</label>
                        <div class="row">
                            <div class="col-md-4">
                                <input type="text" id="size" class="form-control" placeholder="Size" name="size">
                            </div>
                            <div class="col-md-4">
                                <input type="text" id="qty" class="form-control" placeholder="QTY" name="qty">
                            </div>

                            <div class="col-md-4">
                                <input type="button" class="btn btn-warning" value="Apply" onclick="addtable()">
                            </div>
                        </div>


                        <div class="row" style="margin-top: 10px;">
                            <div id="tab" style="max-height:100px; overflow-y: auto;">
                                <%
                                    if (request.getSession().getAttribute("sizes") != null) {
                                %>
                                <table class="col-md-8 table table-responsive">
                                    <tr>
                                        <th>Size</th>
                                        <th>QTY</th>
                                        <th>Action</th>
                                    </tr>
                                    <%
                                        ArrayList<Model> al = (ArrayList<Model>) request.getSession().getAttribute("sizes");
                                        for (Model mo : al) {

                                    %>
                                    <tr>
                                        <td><%=mo.getSize()%></td>
                                        <td><%=mo.getQty()%></td>
                                        <td><input type="button" class="btn btn-danger btn-xs" value="Remove" onclick="abc('<%=al.indexOf(mo)%>')"/></td>
                                    </tr>
                                    <%}%>
                                </table>
                                <%}%>
                            </div>

                        </div>
                            <hr>
                    </div>
                    <div class="row">
                        <form enctype="multipart/form-data" method="post" id="uploadForm" action="fileupload">

                            <div id="progressBox">
                                <input disabled="disabled" id="fileName" placeholder="Choose File"/>

                                <div id="upFile" class="btn btn-primary">
                                    <span>Select</span>
                                    <input onchange="readURL(this)" class="upload" type="file" name="myfile" id="selectFile" multiple/>
                                </div>

                                <div class="progress">
                                    <div class="progress-bar progress-bar-success progress-bar-striped active" id="pBar"></div>
                                </div>
                                <br>
                                <div id="myimg">

                                </div>
                            </div>

                            <br>

                            <input class="btn btn-danger" type="submit" value="Upload My File"/>

                        </form>

                        <!-- <div class="col-md-8"><input type="text" class="form-control" placeholder="Input Shoe Code Here"></div>-->

                        <div class="col-md-8">
                            <hr>
                            <div class="col-md-4"><input type="submit" class="btn btn-danger" value="Save It"></div>
                            <div class="col-md-4"><input type="button" class="btn btn-danger" value="Update"></div>
                            <div class="col-md-4"><input type="button" class="btn btn-danger" value="Delete"></div>

                        </div>
                    </div>

                </div>


            </div>
            <hr>
        </div>
        <div class="col-md-1"></div>




        <script src="js/jquery-3.1.0.min.js"></script>       
        <script src="js/bootstrap.min.js"></script> 
    </body>
</html>
