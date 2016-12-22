<%-- 
    Document   : leftdropdown
    Created on : Sep 21, 2016, 1:41:10 PM
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
    <body>
        <div class="col-sm-3 col-md-3" style="width: 275px;">
            <div class="panel-group" id="accordion">
                <div class="panel panel-default nav nav-pills nav-stacked admin-menu">
                    <div class="panel-heading">
                        <h4 class="panel-title">
                            <a data-toggle="collapse"  data-target-id="1" data-parent="#accordion" href="#collapseOne">Gender</a>
                        </h4>
                    </div>
                    <div id="collapseOne" class="panel-collapse collapse in ">
                        <div class="panel-body">

                            <table class="table">
                                <tr>
                                    <td>
                                <li class="active"><a href="http://localhost:8080/OnlineShoeStore/browseProducts.jsp?map=women"  onclick="women()" data-target-id="1"><i></i>Women</a></li>

                                </td>
                                </tr>
                                <tr>
                                    <td>
                                <li class=""><a href="http://localhost:8080/OnlineShoeStore/browseProducts.jsp?map=men" data-target-id="2"><i></i>Men</a></li>
                                </td>
                                </tr>
                                <tr>
                                    <td>
                                <li class="active"><a href="http://localhost:8080/OnlineShoeStore/browseProducts.jsp?map=girls" data-target-id="3"><i></i>Girls</a></li>
                                </td>
                                </tr>
                                <tr>
                                    <td>
                                <li class="active"><a href="http://localhost:8080/OnlineShoeStore/browseProducts.jsp?map=boys" data-target-id="4"><i></i>Boys</a></li>
                                </td>
                                </tr>
                            </table>
                        </div>
                    </div>
                </div>
                <div class="panel panel-default nav nav-pills">
                    <div class="panel-heading">
                        <h4 class="panel-title">
                            <a data-toggle="collapse"  data-target-id="5" data-parent="#accordion" href="#collapseTwo">Category</a>
                        </h4>
                    </div>
                    <div id="collapseTwo" class="panel-collapse collapse">
                        <div class="panel-body">
                            <table class="table">
                                <tr>
                                    <td>
                                <li class="active"><a href="http://localhost:8080/OnlineShoeStore/browseProducts.jsp?map=boots" data-target-id="6"><i></i>Boots</a></li>
                                </td>
                                <td>
                                <li class="active"><a href="http://localhost:8080/OnlineShoeStore/browseProducts.jsp?map=laceups" data-target-id="7"><i></i>Lace-ups</a></li>
                                </td>
                                </tr>
                                <tr>
                                    <td>
                                <li class="active"><a href="http://localhost:8080/OnlineShoeStore/browseProducts.jsp?map=clogs" data-target-id="8"><i></i>Clogs & Mules</a></li>
                                </td>
                                <td>
                                <li class="active"><a href="http://localhost:8080/OnlineShoeStore/browseProducts.jsp?map=runningshoe" data-target-id="9"><i></i>Running shoes</a></li>
                                </td>
                                </tr>
                                <tr>
                                    <td>
                                <li class="active"><a href="http://localhost:8080/OnlineShoeStore/browseProducts.jsp?map=sandals" data-target-id="10"><i></i>Sandals</a></li>
                                </td>
                                <td>
                                <li class="active"><a href="http://localhost:8080/OnlineShoeStore/browseProducts.jsp?map=slipon" data-target-id="11"><i></i>Slip-ons</a></li>
                                </td>
                                </tr>
                                <tr>
                                    <td>
                                <li class="active"><a href="http://localhost:8080/OnlineShoeStore/browseProducts.jsp?map=slippers" data-target-id="12"><i></i>Slippers</a></li>
                                </td>
                                <td>
                                <li class="active"><a href="http://localhost:8080/OnlineShoeStore/browseProducts.jsp?map=sneakers" data-target-id="13"><i></i>Sneakers</a></li>
                                </td>
                                </tr>
                            </table>
                        </div>
                    </div>
                </div>
                <div class="panel panel-default nav nav-pills">
                    <div class="panel-heading">
                        <h4 class="panel-title">
                            <a data-toggle="collapse" data-target-id="14" data-parent="#accordion" href="#collapseThree">Size</a>
                        </h4>
                    </div>
                    <div id="collapseThree" class="panel-collapse collapse">
                        <div class="panel-body">
                            <table class="table">
                                <tr>
                                    <td>
                                <li class="active"><a href="http://localhost:8080/OnlineShoeStore/browseProducts.jsp?map=28" data-target-id="15"><i></i>28</a></li>

                                </td>
                                <td>
                                <li class="active"><a href="http://localhost:8080/OnlineShoeStore/browseProducts.jsp?map=29" data-target-id="16"><i></i>29</a></li>

                                </td>
                                <td>
                                <li class="active"><a href="http://localhost:8080/OnlineShoeStore/browseProducts.jsp?map=30" data-target-id="17"><i></i>30</a></li>

                                </td>
                                <td>
                                <li class="active"><a href="http://localhost:8080/OnlineShoeStore/browseProducts.jsp?map=31" data-target-id="18"><i></i>31</a></li>

                                </td>
                                </tr>
                                <tr>
                                    <td>
                                <li class=""><a href="http://localhost:8080/OnlineShoeStore/browseProducts.jsp?map=32" data-target-id="19"><i></i>32</a></li>
                                </td>
                                <td>
                                <li class=""><a href="http://localhost:8080/OnlineShoeStore/browseProducts.jsp?map=33" data-target-id="20"><i></i>33</a></li>
                                </td>
                                <td>
                                <li class=""><a href="http://localhost:8080/OnlineShoeStore/browseProducts.jsp?map=34" data-target-id="21"><i></i>34</a></li>
                                </td>
                                <td>
                                <li class=""><a href="http://localhost:8080/OnlineShoeStore/browseProducts.jsp?map=35" data-target-id="22"><i></i>35</a></li>
                                </td>
                                </tr>
                                <tr>
                                    <td>
                                <li class="active"><a href="http://localhost:8080/OnlineShoeStore/browseProducts.jsp?map=36" data-target-id="23"><i></i>36</a></li>
                                </td>
                                <td>
                                <li class="active"><a href="http://localhost:8080/OnlineShoeStore/browseProducts.jsp?map=37" data-target-id="24"><i></i>37</a></li>
                                </td>
                                <td>
                                <li class="active"><a href="http://localhost:8080/OnlineShoeStore/browseProducts.jsp?map=38" data-target-id="25"><i></i>38</a></li>
                                </td>
                                <td>
                                <li class="active"><a href="http://localhost:8080/OnlineShoeStore/browseProducts.jsp?map=39" data-target-id="26"><i></i>39</a></li>
                                </td>
                                </tr>
                                <tr>
                                    <td>
                                <li class="active"><a href="http://localhost:8080/OnlineShoeStore/browseProducts.jsp?map=40" data-target-id="27"><i></i>40</a></li>
                                </td>
                                <td>
                                <li class="active"><a href="http://localhost:8080/OnlineShoeStore/browseProducts.jsp?map=41" data-target-id="28"><i></i>41</a></li>
                                </td>
                                <td>
                                <li class="active"><a href="http://localhost:8080/OnlineShoeStore/browseProducts.jsp?map=42" data-target-id="29"><i></i>42</a></li>
                                </td>
                                <td>
                                <li class="active"><a href="http://localhost:8080/OnlineShoeStore/browseProducts.jsp?map=43" data-target-id="30"><i></i>43</a></li>
                                </td>
                                </tr>
                            </table>
                        </div>
                    </div>
                </div>
                <div class="panel panel-default nav nav-pills">
                    <div class="panel-heading">
                        <h4 class="panel-title">
                            <a data-toggle="collapse" data-target-id="31" data-parent="#accordion" href="#collapseFour">Price Range</a>
                        </h4>
                    </div>
                    <div id="collapseFour" class="panel-collapse collapse">
                        <div class="panel-body">

                            <table class="table">
                                <tr>
                                    <td>
                                <li class="active"><a href="http://localhost:8080/OnlineShoeStore/browseProducts.jsp?map=500" data-target-id="32"><i></i>Upto Rs-500(LKR)</a></li>

                                </td>
                                </tr>
                                <tr>
                                    <td>
                                <li class=""><a href="http://localhost:8080/OnlineShoeStore/browseProducts.jsp?map=1500" data-target-id="33"><i></i>Upto Rs-1500(LKR)</a></li>
                                </td>
                                </tr>
                                <tr>
                                    <td>
                                <li class="active"><a href="http://localhost:8080/OnlineShoeStore/browseProducts.jsp?map=3000" data-target-id="34"><i></i>Upto Rs-3000(LKR)</a></li>
                                </td>
                                </tr>
                                <tr>
                                    <td>
                                <li class="active"><a href="http://localhost:8080/OnlineShoeStore/browseProducts.jsp?map=more3000" data-target-id="35"><i></i>More Than Rs-3000(LKR)</a></li>
                                </td>
                                </tr>
                            </table>

                        </div>
                    </div>
                </div>
<!--                <div class="panel panel-default nav nav-pills">
                    <div class="panel-heading">
                        <h4 class="panel-title">
                            <a data-toggle="collapse" data-target-id="36" data-parent="#accordion" href="#collapsFive">Ratings</a>
                        </h4>
                    </div>
                    <div id="collapsFive" class="panel-collapse collapse">
                        <div class="panel-body">
                            <table class="table">
                                <tr>
                                    <td>
                                <li class="active"><a href="#" data-target-id="37"><i class="glyphicon glyphicon-star"></i><i class="glyphicon glyphicon-star"></i><i class="glyphicon glyphicon-star"></i><i class="glyphicon glyphicon-star"></i><i class="glyphicon glyphicon-star"></i></a></li>

                                </td>
                                </tr>
                                <tr>
                                    <td>
                                <li class=""><a href="#" data-target-id="38"><i class="glyphicon glyphicon-star"></i><i class="glyphicon glyphicon-star"></i><i class="glyphicon glyphicon-star"></i><i class="glyphicon glyphicon-star"></i><i class="glyphicon glyphicon-star-empty"></i>and up</a></li>
                                </td>
                                </tr>
                                <tr>
                                    <td>
                                <li class="active"><a href="#" data-target-id="39"><i class="glyphicon glyphicon-star"></i><i class="glyphicon glyphicon-star"></i><i class="glyphicon glyphicon-star"></i><i class="glyphicon glyphicon-star-empty"></i><i class="glyphicon glyphicon-star-empty"></i>and up</a></li>
                                </td>
                                </tr>
                                <tr>
                                    <td>
                                <li class="active"><a href="#" data-target-id="40"><i class="glyphicon glyphicon-star"></i><i class="glyphicon glyphicon-star"></i><i class="glyphicon glyphicon-star-empty"></i><i class="glyphicon glyphicon-star-empty"></i><i class="glyphicon glyphicon-star-empty"></i>and up</a></li>
                                </td>
                                </tr>
                            </table>
                        </div>
                    </div>

                </div>-->
            </div>
        </div>
        <script src="js/jquery-3.1.0.min.js"></script>       
        <script src="js/bootstrap.min.js"></script>   
    </body>
</html>
