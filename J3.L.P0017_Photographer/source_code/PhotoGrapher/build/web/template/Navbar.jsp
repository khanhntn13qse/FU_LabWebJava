<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link href="assets/css/navbar.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <nav>
            <ul>
                <li <c:if test="${requestScope.active == 1}">
                        class="active"
                    </c:if>>
                    <a href="home">My front page</a>
                </li>
                <li
                    <c:if test="${requestScope.active == 2}">
                        class="active"
                    </c:if>>
                    <a href="gallery?gid=1">Gallery 1</a>
                </li>
                <li
                    <c:if test="${requestScope.active == 2}">
                        class="active"
                    </c:if>>
                    <a href="gallery?gid=2">Gallery 2</a>
                </li>
                <li
                    <c:if test="${requestScope.active == 2}">
                        class="active"
                    </c:if>>
                    <a href="gallery?gid=3">Gallery 3</a>
                </li>
                <li
                    <c:if test="${requestScope.active == 3}">
                        class="active"
                    </c:if>>
                    <a href="contact">Contact</a>
                </li>
            </ul>
        </nav>
    </body>
</html>
