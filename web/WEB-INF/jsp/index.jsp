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
    <p><span>RECENTLY ON HIT</span></p>
    <c:forEach items="${articleSummaries}" var="article">
        <div class="article">
            <div class="articleHeader">
                <h2><a href="articlePage?id=${article.id}">${article.title}</a></h2>
                <p>
                    <c:forEach var="tag" items="${article.tags}">
                        <span>tag </span>
                    </c:forEach>
                </p>
                <p>
                    <a href="./articlesPage?userName=${article.userName}">
                        <img src="./images/avatar/guest.png" style="width: 20px">${article.userNickname}
                    </a>
                </p>
                <p><span>${article.time}</span></p>
            </div>
            <div class="articleExcerpt">
                <p>${article.contentSummary}</p>
            </div>
            <div class="articleCoverImg">
                <img src="./images/cover/${article.cover}" alt="${article.cover}">
            </div>
        </div>
    </c:forEach>
</div>
</body>
</html>
