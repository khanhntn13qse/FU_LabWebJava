<%-- 
    Document   : registerForm
    Created on : Apr 23, 2020, 10:13:45 AM
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
        <title>Register Page</title>
    </head>
    <body>
        <div id="main-panel">
            <jsp:include page="/template/header.jsp"/>

            <div id="main-content">                
                <h4 class="loginFornTitle">Registration form</h4>
                <c:if test="${message != null && !message.equals('') && success != null}">
                    <span class="${success ? 'success' : 'failed'}">${message}</span>
                </c:if>

                <form action="#" method="post">
                    <input type="hidden" name="request" value="register">
                    <table>
                        <tbody>
                            <tr>
                                <td>User Name: </td>
                                <td><input type="text" value="${success ? '' : savedUserName}" name="username" minlength="6" maxlength="50"></td>
                            </tr>
                            <tr>
                                <td>Password: </td>
                                <td><input type="password" name="password" minlength="6" maxlength="50"></td>
                            </tr>
                            <tr>
                                <td>Type</td>
                                <td>
                                    <select name='type' value="${savedType}">
                                        <option value='0' ${savedType == 0 ? "selected" : ""}>Student</option>
                                        <option value='1' ${savedType == 1 ? "selected" : ""}>Teacher</option>
                                    </select>
                                </td>
                            </tr>
                            <tr>
                                <td>Email: </td>
                                <td><input type="email" value="${success ? '' : savedEmail}" name='email' minlength="6" maxlength="50"></td>
                            </tr>
                            <tr>
                                <td></td>
                                <td><input type="submit" value="Register"></td>
                            </tr>
                        </tbody>
                    </table>
                </form>
            </div>
        </div>


    </body>
</html>
