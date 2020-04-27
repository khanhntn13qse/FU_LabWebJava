<%-- 
    Document   : HomePage
    Created on : Apr 20, 2020, 11:07:18 AM
    Author     : Administrator
--%>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Home Page</title>
        <link href="assets/css/style.css" rel="stylesheet" type="text/css"/>     
    </head>
    <body>
        <div class="container">
            <jsp:include page="template/header.jsp"/>
            
            <div class="content">
                <div class="content-left">
                    <div class="title">
                        ${mostNews.title}
                    </div>
                    <div class="images">
                        <img src="${mostNews.image}" alt=""/>
                    </div>

                    <div class="description">
                        ${mostNews.description}
                    </div>
                    <div class="news-footer">
                        By ${mostNews.author} | <fmt:formatDate type="both" value="${mostNews.postDate}"/>
                    </div>
                </div>

                <jsp:include page="template/right_side.jsp"/>           
            </div>
            
            <jsp:include page="template/footer.jsp"/>

        </div>
    </body>
</html>
