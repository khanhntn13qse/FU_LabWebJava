<%-- 
    Document   : quizResult
    Created on : Apr 23, 2020, 10:17:22 AM
    Author     : Administrator
--%>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page import="java.text.DecimalFormat"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="assets/css/common.css">
        <title>Quiz Result Page</title>
    </head>
    <body>
        <div id="main-panel">
            <jsp:include page="/template/header.jsp"/>

            <div id="main-content">
                <p>Your score: 
                    <span class="bold ${mark > 4 ? "success" : "failed"}">
                        <fmt:formatNumber maxFractionDigits="2" value="${mark}"/> (<fmt:formatNumber maxFractionDigits="0" value="${mark * 10}"/> %) - ${mark > 4 ? "PASSED" : "FAILED"}
                    </span>
                </p>
                
                <br>
                <span>Take another quiz</span> 
                <a href="TakeQuiz"><button>Start</button></a>
                
            </div>
        </div>

    </body>
</html>
