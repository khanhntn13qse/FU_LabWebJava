<%-- 
    Document   : errorPage
    Created on : Apr 23, 2020, 10:25:52 AM
    Author     : Administrator
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Error</title>
    </head>
    <body>
        <div id="main-panel">
            <jsp:include page="/template/header.jsp"/>

            <div id="main-content">                
                <h1>An error was detected!</h1>
                <c:if  test="${errorMessage != null}">
                    <p>${errorMessage}</p>
                </c:if>
            </div>
        </div>

    </body>
</html>
