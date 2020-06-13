<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div>
    <img src="./images/cover/${article.cover}">
    <h3>${article.title}</h3>
    <c:set var="userSummary" value="${article.user}"/>
    <%@include file="shared/_userSummary.jsp"%>
    <p>Likes: ${article.likes}</p>
    <p>${article.time}</p>
    <c:if test="${isUserLoggedIn && article.user.userName.equals(user.userName)}">
        <a href="./editArticlePage?id=${article.id}">edit</a>
        <form action="./deleteArticle?id=${article.id}" method="post">
            <button type="submit">Delete</button>
        </form>
    </c:if>
    <p>${article.content}</p>
</div>