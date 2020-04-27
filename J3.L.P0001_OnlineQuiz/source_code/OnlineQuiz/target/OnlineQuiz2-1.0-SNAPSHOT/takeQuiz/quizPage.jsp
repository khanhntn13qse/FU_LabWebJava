<%-- 
    Document   : quizPage
    Created on : Apr 23, 2020, 10:17:00 AM
    Author     : Administrator
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="java.util.List"%>
<%@page import="entity.Question"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" href="assets/css/quizPage.css">
        <link rel="stylesheet" href="assets/css/common.css">
        <script src="assets/js/quizPage.js"></script>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Quiz Page</title>
    </head>
    <body>
        <div id="main-panel">
            <jsp:include page="/template/header.jsp"/>

            <div id="main-content">                
                <div id="quizContainer">
                    <c:if test="${questions == null || questions.isEmpty()}">
                        <h3>No quiz found</h3>
                    </c:if>
                        
                    <c:if test="${questions != null && !questions.isEmpty()}">
                        <h3>Welcome <span class="userName">${sessionScope.user}</span></h3>
                        <h4 id="TimeSpan">Time remaining: <span id="timeDisplay">00:00</span></h4>
                        <h5 id="questionPos">Question: 0/0</h5>
                        <form id="quizForm" action="TakeQuiz" method="post" onsubmit="askForSubmit()">
                            <input type="hidden" name="req" value="quizResult">
                            <input type="hidden" name="numOfQuiz" value="${questions.size()}">

                            <c:forEach items="${questions}" var="item" varStatus="stt">
                                <div id="q${stt.index}" class="hidden">
                                    <input type="hidden" name="q${stt.index}" value="${item.id}" />
                                    <p>${item.content}</p>
                                    <ul>
                                        <c:forEach begin="0" end="${item.option.size() - 1}" var="j">
                                            <input type="checkbox" name="ans${stt.index}-${j}">
                                            <li>${item.option.get(j)}</li>
                                            <br>
                                        </c:forEach>
                                    </ul>
                                </div>
                            </c:forEach>
                          
                            <input id="submitBtn" type="submit" value="Finish">    
                           
                            <button id="next" type="button" onclick="nextQuestion()">Next</button>
                        </form>

                        <script>
                                 setNumOfQuiz(${questions.size()});
                                 quizStart();
                        </script>
                    </c:if>

                </div>
            </div>
        </div>



    </body>
</html>
