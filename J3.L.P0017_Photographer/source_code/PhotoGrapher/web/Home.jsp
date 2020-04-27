<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="assets/css/common.css" rel="stylesheet" type="text/css"/>
        <link href="assets/css/home.css" rel="stylesheet" type="text/css"/>
        <title>Photographer</title>
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
                            <div class="image-intro">
                                <!-- Intro Image -->                           
                                <img src="${requestScope.intro.photo}" alt="${requestScope.intro.title}" class="image-intro"/>
                                <!-- Intro Text -->           
                                <p class="intro-description">
                                    ${requestScope.intro.title}
                                </p>               
                            </div>     
                            <div class="gallery">
                                <c:forEach items="${requestScope.galleries}" var="g">
                                    <div class="gallery-item">
                                        <img src="${g.photo}"/>  
                                        <p>
                                            <a href="gallery?gid=${g.id}">
                                                View ${g.title}
                                            </a>
                                        </p>           
                                        <p class="gallery-description">
                                            ${g.description}
                                        </p>
                                    </div>
                                </c:forEach>
                            </div>
                            <div class="about-me">
                                <h1 class="main-color">
                                    About me
                                </h1>
                                <p class="about-me-description">
                                    ${requestScope.intro.aboutMe}
                                </p>
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
