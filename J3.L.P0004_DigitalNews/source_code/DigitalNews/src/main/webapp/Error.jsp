<%-- 
    Document   : SearchResult
    Created on : Apr 21, 2020, 2:48:49 PM
    Author     : Administrator
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Errors Page</title>
        <link href="assets/css/style.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <div class="container">
            <jsp:include page="template/header.jsp"/>
            <div class="content">
                <div class="content-left">
                    <c:if test="${errorMessage != null}">
                        ${errorMessage}
                    </c:if>
                </div>
            </div>
        </div>

        <jsp:include page="template/footer.jsp"/>

    </body>
</html>
