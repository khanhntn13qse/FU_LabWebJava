<%-- 
    Document   : quizPrepare
    Created on : Apr 23, 2020, 10:17:12 AM
    Author     : Administrator
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="assets/css/common.css">
        <title>Pre-Quiz Page</title>
    </head>
    <body>
        <div id="main-panel">
            <jsp:include page="/template/header.jsp"/>

            <div id="main-content">                
                <h3>Welcome <span class="userName">${sessionScope.user}</span></h3>

                <c:if test="${message != null}">
                    <span class="failed">${message}</span>
                </c:if>

                <form action="TakeQuiz" method="post">
                    <input type="hidden" name="req" value="quizReq">
                    <br>Enter number of question: <br>
                    <input type="number" value="${message != null ? savedNumOfQuiz : ''}" name="numOfQuiz" min="1" max="${maxQuiz}">
                    <input type="submit" value="Start">
                </form>
            </div>
        </div>

    </body>
</html>
