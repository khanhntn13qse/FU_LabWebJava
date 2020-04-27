<%-- 
    Document   : loginForm
    Created on : Apr 23, 2020, 10:13:25 AM
    Author     : Administrator
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="assets/css/common.css">
        <link rel="stylesheet" href="assets/css/loginForm.css">
        <title>Login Page</title>
    </head>
    <body>
        <div id="main-panel">
            <jsp:include page="/template/header.jsp"/>

            <div id="main-content">                
                <h4 id="loginFornTitle">Login Form</h4>

                <c:if test="${(message != null) && message.equals('fail')}">
                    <span class="failed">Username or password is incorrect, please try again</span>
                </c:if>
                
                <form action="Login" method="post">
                    <table>
                        <tbody>
                            <tr>
                                <td>User Name: </td>
                                <td><input type="text" value="${savedUserName}" name="username" required="" maxlength="50"></td>
                            </tr>
                            <tr>
                                <td>Password: </td>
                                <td><input type="password" name="password" required="" maxlength="50"></td>
                            </tr>
                            <tr>
                                <td></td>
                                <td>
                                    <input type="submit" value="Sign In">
                                    <a href="Register">Register</a>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </form>
            </div>
        </div>

    </body>
</html>
