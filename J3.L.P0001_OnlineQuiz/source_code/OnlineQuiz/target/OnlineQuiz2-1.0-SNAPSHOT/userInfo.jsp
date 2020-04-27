<%-- 
    Document   : userInfo
    Created on : Apr 23, 2020, 10:13:55 AM
    Author     : Administrator
--%>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="assets/css/common.css">
        <link rel="stylesheet" href="assets/css/userInfo.css">
        <title>Home Page</title>
    </head>
    <body>

        <div id="main-panel">
            <jsp:include page="template/header.jsp"/>

            <div id="main-content">                
                <h1>User Information</h1>
                Username: ${sessionScope.user}<br>
                Email: ${sessionScope.email}<br>
                Type: ${(Integer.parseInt(sessionScope.userType) == 1)? "Teacher" : "Student"}<br><br>

                <c:if test="${quizHistory == null || quizHistory.size() < 1}">
                    <span>No quiz history found</span>
                </c:if>


                <c:if test="${ quizHistory != null && quizHistory.size() > 0}">
                    <table>
                        <h3 class="quizhistory-header">Quiz history</h3>
                        <thead>
                            <tr>
                                <c:if test="${(Integer.parseInt(sessionScope.userType) == 1)}"> <!-- teacher-->
                                    <th>Student</th>
                                </c:if>
                                <c:if test="${(Integer.parseInt(sessionScope.userType) == 0)}"> <!-- student-->
                                    <th>Ordered Number</th>
                                </c:if>
                                
                                <th>Total</th>
                                <th>Correct</th>
                                <th>Mark</th>
                                <th>Status</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach items="${quizHistory}" var="q" varStatus="varStatus">
                                <tr>
                                    <c:if test="${(Integer.parseInt(sessionScope.userType) == 1)}"> <!-- teacher-->
                                        <td>${q.studentName}</td>
                                    </c:if>
                                    <c:if test="${(Integer.parseInt(sessionScope.userType) == 0)}"> <!-- student-->
                                        <td>${varStatus.index + 1}</td>
                                    </c:if>
                                    <td>${q.numOfQuiz}</td>
                                    <td>${q.correctAnswer}</td>
                                    <td><fmt:formatNumber maxFractionDigits="2" value="${q.correctAnswer / q.numOfQuiz * 10}"/></td>
                                    <td>${(q.correctAnswer / q.numOfQuiz * 10 > 4)?  "Passed" : "Failed"}</td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </c:if>

            </div>
        </div>
    </body>
</html>
