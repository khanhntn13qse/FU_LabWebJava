<%-- 
    Document   : Detail
    Created on : Apr 22, 2020, 3:59:30 PM
    Author     : Administrator
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Detail Page</title>
        <link href="assets/css/style.css" rel="stylesheet" type="text/css"/>
    </head>

    <body>
        <div class="container">
            <jsp:include page="template/header.jsp"/>

            <div class="content">
                <div class="content-left">
                    <c:if test="${notfound}">
                        <p>Not found news</p>
                    </c:if>

                    <c:if test="${notfound == null}">
                        <div class="title">
                            ${news.title}
                        </div>
                        <div class="images">
                            <img src="${news.image}" alt=""/>
                        </div>

                        <div class="description">
                            ${news.description}
                        </div>
                        <div class="news-footer">
                            By ${news.author} | <fmt:formatDate type="both" value="${news.postDate}"/>
                        </div>
                    </c:if>
                </div>

                <jsp:include page="template/right_side.jsp"/>           
            </div>
            <jsp:include page="template/footer.jsp"/>
        </div>
    </body>
</html>
