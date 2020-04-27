<%-- 
    Document   : makeQuiz
    Created on : Apr 23, 2020, 10:24:38 AM
    Author     : Administrator
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    String[] answers = new String[4];

    String answer = (String) request.getAttribute("answer");
    if (answer != null && answer.length() > 0) {
        for (int i = 0; i < answer.length(); i++) {
            char x = answer.charAt(i);
            int index = (int) x - 49;
            answers[index] = "checked";
        }
    }
%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" href="assets/css/makeQuiz.css">
        <link rel="stylesheet" href="assets/css/common.css">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Make Quiz Page</title>
    </head>
    <body>
        <div id="main-panel">
            <jsp:include page="/template/header.jsp"/>

            <div id="main-content">              

                <c:if test="${message != null}">
                    <span class="failed">${message}</span>
                </c:if>

                <form action="MakeQuiz" method="post">
                    <table>
                        <tbody>
                            <tr class="quizRow">
                                <td>Question: </td>
                                <td><input class="quizinput" type="text" id="content" name="content" required="" value="${content}" /></td>
                            </tr>
                            <tr class="quizRow">
                                <td>Option 1</td>
                                <td><input class="quizinput" type="text" name="opt1" maxlength="100" value="${opt1}" required=""/></td>
                            </tr>
                            <tr class="quizRow">
                                <td>Option 2</td>
                                <td><input class="quizinput" type="text" name="opt2" maxlength="100" value="${opt2}" required=""/></td>
                            </tr >
                            <tr class="quizRow">
                                <td>Option 3</td>
                                <td><input class="quizinput" type="text" name="opt3" maxlength="100" value="${opt3}" required=""/></td>
                            </tr>
                            <tr class="quizRow">
                                <td>Option 4</td>
                                <td><input class="quizinput" type="text" name="opt4" maxlength="100" value="${opt4}" required=""/></td>
                            </tr>
                            <tr class="quizRow">
                                <td>Answer(s)</td>
                                <td>
                                    <input type="checkbox" name="ans1"  ${pageScope.answers[0]}> Option 1
                                    <input type="checkbox" name="ans2" ${pageScope.answers[1]}> Option 2
                                    <input type="checkbox" name="ans3" ${pageScope.answers[2]}> Option 3
                                    <input type="checkbox" name="ans4" ${pageScope.answers[3]}> Option 4
                                </td>
                            </tr>
                            <tr>
                                <td></td>
                                <td><input type="submit" value="Save"></td>
                            </tr>
                        </tbody>
                    </table>
                </form>
            </div>
        </div>

    </body>
</html>
