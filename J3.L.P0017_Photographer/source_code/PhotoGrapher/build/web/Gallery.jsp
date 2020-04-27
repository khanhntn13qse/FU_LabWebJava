<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="assets/css/common.css" rel="stylesheet" type="text/css"/>
        <link href="assets/css/gallery.css" rel="stylesheet" type="text/css"/>
        <title>Gallery</title>
    </head>
    <body >
        <div class="site-full">
            <jsp:include page="template/Navbar.jsp"/>
            <jsp:include page="template/Header.jsp"/>
            <div class="site-wrap">
                <div class="container">
                    <div class="content">
                        <!-- Page Left-->
                        <script src="../assets/js/gallery.js" type="text/javascript"></script>
                        <div class="content-left">
                            <h1>${requestScope.gallery}</h1>
                            
                            <div class="slide-show">
                                <img id="imageShow" src="${requestScope.photos[0].image}"/>
                                <div class="play-button">
                                    <img id="playButton" src="assets/images/frontend/icon_play.png" style="width:64px;"/>
                                </div>
                            </div>
                                
                            <div class="photo-list">
                                <c:forEach items="${requestScope.photos}" var="p">         
                                    <div class="photo-item" onclick="updateImage('${p.image}')">
                                        <img src="${p.image}" class="imageThumb"/>
                                        <span class="image-description">${p.title}</span>
                                    </div>
                                </c:forEach>
                            </div>
                        </div>
                        <!-- Ads -->
                        <div class="content-right">
                            <jsp:include page="template/Ads.jsp"/>
                        </div>
                    </div>                 
                </div>
            </div>
            <jsp:include page="template/Footer.jsp"/>
        </div> 
        <script defer src="assets/js/gallery.js"></script>
    </body>
</html>
