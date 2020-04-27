<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="assets/css/common.css" rel="stylesheet" type="text/css"/>
        <link href="assets/css/contact.css" rel="stylesheet" type="text/css"/>
        <title>Contact Us</title>
    </head>
    <body>
        <div class="site-full">
            <jsp:include page="template/Navbar.jsp"/>
            <jsp:include page="template/Header.jsp"/>
            <div class="site-wrap">
                <div class="container">
                    <div class="content">
                        <!-- Page Left-->
                        <div class="content-left">
                            <div class="contact">
                                <h1>Contact</h1>
                                <br/><br/>
                                <h2>
                                    ${requestScope.contact.title}
                                </h2>
                                <br/>
                                <p>
                                    Address: ${requestScope.contact.address}
                                </p>
                                <p>
                                    City: ${requestScope.contact.city}
                                </p>
                                <p>
                                    Country: ${requestScope.contact.country}
                                </p>
                                <br/>
                                <p>
                                    Tel: ${requestScope.contact.telephone}
                                </p>
                                <p>
                                    Email: ${requestScope.contact.email}
                                </p>
                                <div class="gg-maps">
                                    <img src="assets/images/frontend/map.png"/>
                                </div>
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
    </body>
</html>
