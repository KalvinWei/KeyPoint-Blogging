<%--
  Created by IntelliJ IDEA.
  User: kalvinwei
  Date: 10/06/20
  Time: 09:51
  To change this template use File | Settings | File Templates.

  --from indexPage
  articleSummaries[]                                        [recent articles list]
    articleSummary(title,content,time,cover,author)

  # => articleSummaries

--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>KeyPoint</title>
</head>
<body>
<%@include file="shared/navbar.jsp"%>

<div id="recentArticles">
    <div class="card-columns">
    <c:forEach items="${articleSummaries}" var="article">
        <div class="card">
            <img src="./images/cover/cover1.jpg" alt="${article.cover}" class="card-img-top">
            <div class="card-body">
                <h3 class="card-title"><a href="articlePage?id=${article.id}">${article.title}</a></h3>
                <a href="./articlesPage?userName=${article.userName}" class="card-link">
                    <img src="./images/avatar/guest.png" style="width: 20px">${article.userNickname}
                </a>
                <span class="card-text text-info">${article.time}</span>
                <div>
                    <c:forEach var="tag" items="${article.tags}">
                        <span class="badge badge-pill badge-light">${tag}</span>
                    </c:forEach>
                </div>
                <div class="card-text">
                    <p>${article.contentSummary}</p>
                </div>
            </div>
        </div>
    </c:forEach>
    </div>
</div>
</body>
</html>
