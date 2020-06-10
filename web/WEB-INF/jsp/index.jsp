<%--
  Created by IntelliJ IDEA.
  User: kalvinwei
  Date: 10/06/20
  Time: 09:51
  To change this template use File | Settings | File Templates.

  --from indexPage
  user(nickname,avatar)                                     [for navbar]
  articleSummaries[]                                        [recent articles list]
    articleSummary(title,content,time,cover,author)
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%@include file="shared/navbar.jsp"%>
<div id="recentArticles">
    <p><span>RECENTLY ON HIT</span></p>
    <c:forEach items="recentArticles" var="article">
        <div class="article">
            <div class="articleHeader">
                <p>${article.title}</p>
                <p><span>${article.auther}</span></p>
                <p><span>${article.datetime}</span></p>
            </div>
            <div class="articleExcerpt">
                <p>${article.exerpt}</p>
            </div>
            <div class="articleCoverImg">
                <img src="/images/${article.coverImage}" alt="${article.coverImage}">
            </div>
        </div>
    </c:forEach>
</div>
</body>
</html>
