<%-- 
    Document   : header
    Created on : Apr 23, 2020, 5:33:54 PM
    Author     : Administrator
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<link rel="stylesheet" href="assets/css/header.css">
<link rel="stylesheet" href="assets/css/common.css">

<div id="nav-bar">
    <ul>
        <li><a href='Index'>Home</a></li>
        <li><a href='TakeQuiz'>Take Quiz</a></li>
        <li><a href='MakeQuiz'>Make Quiz</a></li>
        <li><a href='ManageQuiz'>Manage Quiz</a></li>

        <c:if test="${sessionScope.user != null}">
            <li><a href='Logout'>Logout</a></li>
            </c:if>

    </ul>
</div>

