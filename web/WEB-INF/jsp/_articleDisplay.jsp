<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="card border-0 mt-2">
    <img src="./images/cover/${article.cover}" class="card-img-top" style="max-height: 200px; object-fit: cover">
    <div class="card-body mx-lg-4">
        <h2 class="font-weight-bolder text-left">${article.title}</h2>
        <p class="my-1 summary-info">
            <c:set var="userSummary" value="${article.user}"/>
            <%@include file="shared/_userSummary.jsp" %>
            <span class="time">&nbsp;${article.time}&nbsp;</span>
        </p>
        <p class="my-2">
            <c:forEach var="tag" items="${article.tags}">
                <a href="./articlesByTagPage?tag=${tag}" class="badge badge-secondary px-1">${tag}</a>
            </c:forEach>
        </p>
        <c:if test="${isUserLoggedIn}">
            <span id="articleLikes_${article.id}">${article.likes}</span>
            <form id="likeArticleForm_${article.id}" action="./likeArticle" method="post" class="d-none">
                <input type="hidden" name="user" value="${user.id}">
                <input type="hidden" name="article" value="${article.id}">
                <button id="likeArticleButton_${article.id}" type="submit" class="btn btn-sm btn-info">Like</button>
            </form>
            <form id="unlikeArticleForm_${article.id}" action="./unlikeArticle" method="post" class="d-none">
                <input type="hidden" name="user" value="${user.id}">
                <input type="hidden" name="article" value="${article.id}">
                <button id="unlikeArticleButton_${article.id}" type="submit" class="btn btn-sm btn-info">Unlike</button>
            </form>
            <script>
                enableArticleLike(${article.id});
                enableArticleUnlike(${article.id});
                checkArticleLike(${user.id}, ${article.id});
            </script>
        </c:if>
        <p class="text-justify">${article.content}</p>
        <c:if test="${isUserLoggedIn && article.user.userName.equals(user.userName)}">
            <a href="./editArticlePage?id=${article.id}" class="btn btn-sm btn-info">edit</a>
            <form action="./deleteArticle?id=${article.id}" method="post" class="d-inline">
                <button type="submit" class="btn btn-sm btn-info">Delete</button>
            </form>
        </c:if>
    </div>
</div>