<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

        <div class="content-right">
            <div class="mostnews">
                <div class="right-header">
                    Digital News
                </div>
                <div class="short-des">
                    ${mostNews.shortDes}
                </div>
            </div>
                
            <div class="search">
                <div class="right-header">
                    Search
                </div>
                <form action="search?index=1" method="get">
                    <input class="inputTxt" type ="text" name="searchPattern" required="Not blank" maxlength="100">
                    <input class="inputSubmit" type="submit" value="Go">
                </form>
            </div>

            <div class="article-list">
                <div class="right-header">Last Articles</div>
                <c:if test="${top5Next.size() == null || top5Next.size() < 1}">
                    <div class="article-item">
                        Not have more news
                    </div>
                </c:if>
                
                <c:if test="${top5Next.size() != null || top5Next.size() >0}">
                    <c:forEach items="${top5Next}" var="x">
                        <div class="article-item">
                            <a href="detail?id=${x.idl}">${x.title}</a>
                        </div>
                    </c:forEach>
                </c:if>
            </div>
        </div>