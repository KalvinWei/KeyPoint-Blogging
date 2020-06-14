<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div>
    <img src="./images/cover/${article.cover}">
    <h3>${article.title}</h3>
    <c:set var="userSummary" value="${article.user}"/>
    <%@include file="shared/_userSummary.jsp"%>
    <p>${article.time}</p>
    <div>
        <c:forEach var="tag" items="${article.tags}">
            <span class="badge badge-pill badge-light">${tag}</span>
        </c:forEach>
    </div>
    <c:if test="${isUserLoggedIn && article.user.userName.equals(user.userName)}">
        <a href="./editArticlePage?id=${article.id}">edit</a>
        <form action="./deleteArticle?id=${article.id}" method="post">
            <button type="submit">Delete</button>
        </form>
    </c:if>
    <p>${article.content}</p>
</div>