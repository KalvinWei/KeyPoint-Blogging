<%--
  Created by IntelliJ IDEA.
  User: yihao
  Date: 2020/6/13
  Time: 11:16
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div>
    <c:forEach items="${articleSummaries}" var="article">
        <div>
            <hr />
            <img src="./images/cover/cover1.jpg" alt="${article.cover}" class="card-img-top">
            <div>
                <h3><a href="articlePage?id=${article.id}">${article.title}</a></h3>
                <a href="./articlesPage?userName=${article.userName}" class="card-link">
                    <img src="./images/avatar/guest.png" style="width: 20px">
                        ${article.userNickname}
                </a>
                <span>${article.time}</span>
                <div>
                    <c:forEach var="tag" items="${article.tags}">
                        <span class="badge badge-pill badge-light">${tag}</span>
                    </c:forEach>
                </div>
                <div>
                    <p>${article.contentSummary}</p>
                </div>
            </div>
        </div>
    </c:forEach>
</div>
