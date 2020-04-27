<%-- 
    Document   : SearchResult
    Created on : Apr 21, 2020, 2:48:49 PM
    Author     : Administrator
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Result Search Page</title>
        <link href="assets/css/style.css" rel="stylesheet" type="text/css"/>
    </head>

    <body>
        <div class="container">
            <jsp:include page="template/header.jsp"/>

            <div class="content">
                <div class="content-left">
                    <c:if test="${resultSearch == null || resultSearch.size() < 1}">
                        <p> Have no news</p>
                        <p>${errorMessage}</p>
                    </c:if>

                    <c:if test="${resultSearch != null || resultSearch.size() < 1}">
                        <c:forEach items = "${resultSearch}" var = "item">
                            <div class="listDigital">
                                <div class="title">
                                    <a href = "detail?id=${item.idl}">${item.title}</a>
                                </div>
                                <div class="infor">
                                    <div class="image_search">
                                        <img src="${item.image}" alt=""/>                                  
                                    </div>
                                    <div class="short-des-search">
                                        ${item.shortDes}
                                    </div>
                                </div>

                            </div>
                        </c:forEach>

                        <div class="paging">
                            <c:forEach begin="1" end="${pageNumber}" var="i">
                                <a class="${(param.index==i)? 'active' : ''}" href="search?index=${i}&searchPattern=${searchPattern}">${i}</a>
                            </c:forEach>
                        </div>            
                    </c:if>

                </div>

                <jsp:include page="template/right_side.jsp"/>   
            </div>

            <jsp:include page="template/footer.jsp"/>
        </div>
    </body>
</html>
