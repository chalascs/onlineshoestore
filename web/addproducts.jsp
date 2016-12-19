<%-- 
    Document   : addproducts
    Created on : Sep 22, 2016, 11:13:56 PM
    Author     : Shanaka
--%>

<%@page import="org.hibernate.criterion.Order"%>
<%@page import="DB.Stock"%>
<%@page import="org.hibernate.criterion.Projections"%>
<%@page import="org.hibernate.criterion.Projection"%>
<%@page import="org.hibernate.criterion.Restrictions"%>
<%@page import="DB.Catagory"%>
<%@page import="connection.NewHibernateUtil"%>
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
                <script src="js/jquery-3.1.0.min.js" type="text/javascript"></script>
                <script src="js/jquery.form.js" type="text/javascript"></script>
                <script src="js/progressBarScript.js" type="text/javascript"></script>
                <script src="js/bootstrap.min.js"></script>
       

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
            .topbar li {
                color: white;
            }
            .topbar li a{
                color: white;
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
                        }
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
                var ty;
                xhttp.onreadystatechange = function() {
                    if (xhttp.readyState === 4 && xhttp.status === 200) {
                        document.getElementById("tab").innerHTML = xhttp.responseText;
                        document.getElementById("size").value = "";
                        document.getElementById("qty").value = "";
                    }
                };
                if (size !== "" && qty !== "") {
                    if (size > 22 && size < 44) {
                        ty = "";
                        xhttp.open("GET", "addtotable?size=" + size + "&qty=" + qty + "&type=AddItem", true);
                        xhttp.send();
                    } else {
                        ty = "Please Enter A Size Between 23 - 43";
                    }
                    document.getElementById("demo").innerHTML = ty;
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

            // sending data to save... .. .
            function sendData() {

                var xhttp = new XMLHttpRequest();
                var id = document.getElementById("id").value;
                var pname = document.getElementById("pname").value;
                var price = document.getElementById("price").value;
                var target = document.getElementById("target").value;
                var cattype = document.getElementById("cattype").value;
                alert(cattype);
                var discription = document.getElementById("discription").value;
                var discount = document.getElementById("discount").value;
                var code = document.getElementById("code").value;
                var Type = "AddToStock";
                xhttp.onreadystatechange = function() {
                    if (xhttp.readyState === 4 && xhttp.status === 200) {
                        document.getElementById("tab").innerHTML = xhttp.responseText;
                        document.getElementById("id").value = "";
                        document.getElementById("pname").value = "";
                        document.getElementById("price").value = "";
                        document.getElementById("target").value = "";
                        document.getElementById("cattype").value = "";
                        document.getElementById("discription").value = "";
                        document.getElementById("discount").value = "";
                        document.getElementById("code").value = "";
                    }
                };

                if (size !== "" && qty !== "") {
                    xhttp.open("GET", "stock?id=" + id + "&pname=" + pname + "&price=" + price + "&target=" + target + "&cattype=" + cattype + "&discription=" + discription + "&discount=" + discount + "&Type=" + Type + "&code=" + code, true);
                    xhttp.send();

                }

            }

        </script>
    </head>
    <%        if (request.getSession().getAttribute("user") == null) {
            response.sendRedirect("login.jsp");
        }
    %>
    <body id="addproduct">
        <%
//        response.
        %>
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
                    <%                        Session ses = NewHibernateUtil.getSessionFactory().openSession();
                        Criteria crr = ses.createCriteria(DB.Stock.class);
                        crr.addOrder(Order.desc("stid"));
                        crr.setMaxResults(1);
                        Stock sst = (Stock) crr.uniqueResult();


                    %>
                    <div class="col-md-8"><input type="text" class="form-control" placeholder="Product ID" id="id" value="<%=sst.getStid() + 1%>"></div>
                    <div class="col-md-8"><input type="text" class="form-control" placeholder="Product Name" id="pname"></div>
                    <div class="col-md-8"><input type="text" class="form-control" placeholder="Enter Price" id="price"></div>
                    <div class="col-md-8">
                        <label class="">Select your targeted population</label>
                        <div class="row">
                            <div class="col-md-5">
                                <select class="form-control" id="target">
                                    <option>Women</option>
                                    <option>Men</option>
                                    <option>Girls</option>
                                    <option>Boys</option>
                                </select>
                            </div>
                        </div>
                    </div>

                    <div class="form-group col-md-8">
                        <label for="gender">Which type is your product?</label>
                        <select class="form-control" id="cattype">
                            <%                                // Session ses = NewHibernateUtil.getSessionFactory().openSession();
                                Criteria cr = ses.createCriteria(DB.Catagory.class);
                                List<Catagory> cat = cr.list();
                                for (Catagory crt : cat) {
                            %>

                            <option><%=crt.getCatagory()%></option>
                            <%}%>
                            <!--                            <option>Lace-ups</option>
                                                        <option>Clogs & Mules</option>
                                                        <option>Running shoes</option>
                                                        <option>Sandals</option>
                                                        <option>Slip-ons</option>
                                                        <option>Slippers</option>
                                                        <option>Sneakers</option>-->
                        </select>
                    </div>
                    <div class="col-md-8"><textarea class="form-control" placeholder="Product Discription (This will show below the product)" id="discription"></textarea></div>
                    <div class="col-md-8"><input type="text" class="form-control" placeholder="Discount(%)" id="discount"></div>
                    <div class="col-md-8"><input type="text" class="form-control" placeholder="Your Product Code Here" id="code"/></div>

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
                                <input type="button" class="btn btn-warning balackcolor" value="Apply" onclick="addtable()">
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
                    <div id="demo" class="col-md-4" style="margin-top: 22px; color: #ff3300"></div>

                    <div class="row">
                        <!-- File Upload-->  
                        <div class="col-md-8">  
                            <form enctype="multipart/form-data" method="post" id="uploadForm" action="fileupload">
                                <div class="row">
                                    <div id="progressBox" class="col-md-7">
                                        <input disabled="disabled" id="fileName" placeholder="Choose File"/>
                                        <div id="upFile" class="btn btn-primary">
                                            <span>Select</span>
                                            <input onchange="readURL(this)" class="upload" type="file" name="myfile" id="selectFile" multiple/>
                                        </div>
                                        <div class="progress col-md-8">
                                            <div class="progress-bar progress-bar-success progress-bar-striped active" id="pBar"></div>
                                        </div>
                                        <br>
                                    </div>
                                </div>
                                <br>
                                <input class="btn btn-danger" type="submit" value="Upload My File"/>
                        </div>
                        <div id="myimg" class="col-md-4">
                        </div>
                        </form>
                    </div>

                    <div class="row">
                        <div class="col-md-8">
                            <hr>
                            <div class="col-md-4"><input type="submit" class="btn btn-danger" value="Save It" onclick="sendData()"></div>
                            <div class="col-md-4"><input type="button" class="btn btn-danger" value="Update"></div>
                            <div class="col-md-4"><input type="button" class="btn btn-danger" value="Delete"></div>

                        </div>
                    </div>
                </div>

            </div>


        </div>

    </div>
    <div class="col-md-1"></div>



</body>
</html>
