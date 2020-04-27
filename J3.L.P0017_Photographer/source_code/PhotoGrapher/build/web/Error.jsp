<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="assets/css/common.css" rel="stylesheet" type="text/css"/>
        <link href="assets/css/contact.css" rel="stylesheet" type="text/css"/>
        <title>Error Page</title>
    </head>
    <body>
        <h1>Something error occurred :(</h1>
        <p>
            Reason: <strong>${requestScope.errorMessage}</strong> 
        </p>
    </body>
</html>
