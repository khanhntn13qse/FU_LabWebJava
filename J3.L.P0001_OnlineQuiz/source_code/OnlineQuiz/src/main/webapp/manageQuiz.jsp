<%-- 
    Document   : manageQuiz
    Created on : Apr 23, 2020, 10:13:35 AM
    Author     : Administrator
--%>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" href="assets/css/manageQuiz.css">
        <link rel="stylesheet" href="assets/css/common.css">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script src="assets/js/manageQuiz.js"></script>
        <title>Manage Quiz Page</title>
    </head>
    <body>
        <div id="main-panel">
            <jsp:include page="/template/header.jsp"/>

            <div id="main-content"> 
                <c:if test="${questions == null || questions.isEmpty()}">
                    <h5>No question available</h5>
                </c:if>

                <c:if test="${questions != null && !questions.isEmpty()}">
                    <h3>Number of question: <span class="blue">${numOfQuiz}</span></h3>
                    <table>
                        <colgroup>
                            <col class="labelCol">
                            <col class="fieldCol">
                            <col class="fieldAction">
                        </colgroup>
                        <thead>
                            <tr>
                                <th>Question</th>
                                <th>Date Created</th>
                                <th>Action</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach items="${questions}" var="item">
                                <tr>
                                    <td>${item.content}</td>
                                    <td><fmt:formatDate type="date" value="${item.created}"/></td>
                                    <td>
                                        <button onclick="delQuestion('${ (requestScope.currentPage == null)? 1 : requestScope.currentPage }', '${item.id}')">Delete</button>
                                    </td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>

                    <c:if test="${numOfPage > 1}">
                        <ul id="pageList">                      
                            <c:forEach begin="1" end="${numOfPage}" var="i">
                                <a href="ManageQuiz?currentPage=${i}">
                                    <li class="${(requestScope.currentPage == i) ? 'selected' : ''}">${i}
                                    </li>
                                </a>

                            </c:forEach>
                        </ul>
                    </c:if>

                </c:if>

            </div>
        </div>


    </body>
</html>
