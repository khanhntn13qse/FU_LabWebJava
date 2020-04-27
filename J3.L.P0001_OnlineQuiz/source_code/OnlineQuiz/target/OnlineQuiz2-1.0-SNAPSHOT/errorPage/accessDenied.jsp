<%-- 
    Document   : accessDenied
    Created on : Apr 23, 2020, 10:25:39 AM
    Author     : Administrator
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Access Denied Page</title>
    </head>
    <body>
         <div id="main-panel">
            <jsp:include page="/template/header.jsp"/>
            
            <div id="main-content">                
                <h1>Access Denied!</h1>
                <p>You do not have permission to access this path</p>
            </div>
        </div>
        
    </body>
</html>