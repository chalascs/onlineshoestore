<%-- 
    Document   : newjsp
    Created on : Oct 5, 2016, 10:19:31 PM
    Author     : Shanaka
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style>
 
html {
  width: 100%;
  height: 100%;
  box-sizing: border-box;
  background: #000;
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
  letter-spacing: -5px;
}
svg {
  width:100%;
  height: 100%;
}
        </style>
    </head>
    <body>
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
  

    
  </svg>
<div class="child">
Clouds<br /> of æther.</div>
  
  <td style="vertical-align: top;" id="viewadsList">
                                    <%

                                        int fr = 0;
                                        if (request.getParameter("pid") != null) {
                                            int q = Integer.parseInt(request.getParameter("pid").toString());
                                            fr = q * 2;
                                        }
                                        Criteria cr1 = ses.createCriteria(DB.Advertisements.class);
                                        cr1.add(Restrictions.eq("viewStatus", "Confirmed"));
                                        if (but != null) {
                                            cr1.add(Restrictions.eq("mainCategory", but));
                                        }
                                        if (Subbut != null) {
                                            cr1.add(Restrictions.eq("subCategory", Subbut));
                                        }
                                        cr1.addOrder(Order.desc("idads"));
                                        int y = cr1.list().size() / 2;
                                        if (cr1.list().size() % 2 == 1) {
                                            y += 1;
                                        }
                                        cr1.setFirstResult(fr);
                                        cr1.setMaxResults(4);
                                        List<DB.Advertisements> adsss = cr1.list();
                                        if (!adsss.isEmpty()) {
                                            for (Advertisements ads1 : adsss) {
                                                Criteria cr2 = ses.createCriteria(DB.AdsAttachment.class);
                                                cr2.add(Restrictions.eq("advertisements", ads1));
                                                cr2.add(Restrictions.eq("mainImage", "1"));
                                                AdsAttachment adsatt = (AdsAttachment) cr2.uniqueResult();
                                    %>
                                    <div class="mainDiv2-SubDiv">
                                        <table style="border: 0px;">
                                            <tr>
                                                <td>
                                                    <div class="AdvertisementDiv-PublishAds">
                                                            <div class="AdvertisementDiv-PublishAds-Div1">
                                                                <div class="AdvertisementDiv-PublishAds-Div1-images" onclick="SelectedAdsView(<%=ads1.getIdads()%>)"><img src="<%=(adsatt != null) ? adsatt.getPath() : "image/home/home-slider/regalliving.jpg"%>" style="width: 100%; height: 100%;" onmousedown="return false"></div>
                                                                <div class="AdvertisementDiv-PublishAds-Div1-title" onclick="SelectedAdsView(<%=ads1.getIdads()%>)"><%=ads1.getAdsTitle()%></div><br>
                                                                <div class="AdvertisementDiv-PublishAds-Div1-Price" onclick="SelectedAdsView(<%=ads1.getIdads()%>)">LKR:<%if (!ads1.getAdsPayments().isEmpty()) {%><%=((AdsPayment) ads1.getAdsPayments().toArray()[0]).getAdsPayment()%>(<%=((AdsPayment) ads1.getAdsPayments().toArray()[0]).getValidTime()%>)<%} else {%>0.00<%}%> </div><br>
                                                                <div class="AdvertisementDiv-PublishAds-Div1-address" onclick="SelectedAdsView(<%=ads1.getIdads()%>)"><i class="fa fa-map-marker"></i>&nbsp<%=ads1.getAdsAddress()%></div><br>
                                                                <%
                                                                    User us = (User) request.getSession().getAttribute("User_logId");
                                                                    if (us != null) {
                                                                        Criteria cr11 = ses.createCriteria(DB.Favourite.class);
                                                                        cr11.add(Restrictions.and(Restrictions.eq("advertisements", ads1), Restrictions.eq("user", us)));
                                                                        Favourite fav1 = (Favourite) cr11.uniqueResult();
                                                                        if (fav1 != null) {
                                                                %>
                                                                <div class="AdvertisementDiv-PublishAds-Div1-Details" id="AdvertisementFavourite3"><i class="fa fa-star" style="color: #ffcc00;" onclick="deleteFavorites(<%=fav1.getIdFavourite()%>)"></i>&nbsp&nbsp<span onclick="deleteFavorites(<%=fav1.getIdFavourite()%>)">Unfavorite</span></div><br>
                                                                <%} else {%>
                                                                <div class="AdvertisementDiv-PublishAds-Div1-Details" id="AdvertisementFavourite1"><i class="fa fa-star-o" onclick="AddFavorites(<%=ads1.getIdads()%>)"></i>&nbsp&nbsp<span onclick="AddFavorites(<%=ads1.getIdads()%>)">Favorite</span></div><br>
                                                                <%}
                                                                } else {%>
                                                                <div class="AdvertisementDiv-PublishAds-Div1-Details" id="AdvertisementFavourite2"><i class="fa fa-star-o" onclick="AddFavorites(<%=ads1.getIdads()%>)"></i>&nbsp&nbsp<span onclick="AddFavorites(<%=ads1.getIdads()%>)">Favorite</span></div><br>
                                                                <%}%>
                                                            </div>
                                                        </div>
                                                </td>
                                            </tr>
                                        </table>
                                    </div>
                                    <%}
                                    } else {%>
                                    <div class="mainDiv2-SubDiv">
                                        <table style="border: 0px;">
                                            <tr>
                                                <td>
                                                    <div class="AdvertisementDiv-PublishAds">
                                                        <div class="AdvertisementDiv-PublishAds-Div1">
                                                            <div class="AdvertisementDiv-PublishAds-Div1-images"><img src="image/home/home-slider/regalliving.jpg" style="width: 100%; height: 100%;" onmousedown="return false"></div>
                                                            <div class="AdvertisementDiv-PublishAds-Div1-title">Empty Title</div><br>
                                                            <div class="AdvertisementDiv-PublishAds-Div1-Price">Empty Price</div><br>
                                                            <div class="AdvertisementDiv-PublishAds-Div1-address"><i class="fa fa-map-marker"></i>&nbspEmpty Address</div><br>
                                                            <div class="AdvertisementDiv-PublishAds-Div1-Details"></div><br>
                                                        </div>
                                                    </div>
                                                </td>
                                            </tr>
                                        </table>
                                    </div>
                                    <%}%>


                                </td>
                                
                                
                                <%
                                    for (int x = 0; x < y; x++) {
                                %>
                                <td><a href="ViewAdvertisements.jsp?pid=<%=x%>"><button><%=x%></button></a></td>
                                            <%}%>
    </body>
</html>
