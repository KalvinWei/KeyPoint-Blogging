<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="card border-0 mt-2">
    <img src="./images/cover/${article.cover}" class="card-img-top" style="max-height: 200px; object-fit: cover">
    <div class="card-body mx-lg-4">
        <h2 class="font-weight-bolder text-left">${article.title}</h2>
        <p class="my-1 font-italic"><small>
            <c:set var="userSummary" value="${article.user}"/>
            <%@include file="shared/_userSummary.jsp" %>
            / <span>${article.time}</span></small></p>
        <p class="my-2">
            <c:forEach var="tag" items="${article.tags}">
                <a href="./articlesByTagPage?tag=${tag}" class="badge badge-secondary px-1">${tag}</a>
            </c:forEach>
        </p>
        <p class="text-justify">${article.content}</p>
        <c:if test="${isUserLoggedIn}">
            <form id="likeArticleForm_${article.id}" action="./likeArticle" method="post">
                <input type="hidden" name="user" value="${article.user.id}">
                <input type="hidden" name="article" value="${article.id}">
                <button id="likeArticleButton_${article.id}" type="submit">Like</button>
            </form>
            <script>
                $("#likeArticleButton_${article.id}").click(function() {
                    $.ajax({
                        type: "POST",
                        url: "./likeArticle",
                        data: $("#likeArticleForm_${article.id}").serialize(),
                        success: function() {
                        }
                    });
                    return false;
                });
            </script>
            <form id="unlikeArticleForm_${article.id}" action="./unlikeArticle" method="post">
                <input type="hidden" name="user" value="${article.user.id}">
                <input type="hidden" name="article" value="${article.id}">
                <button id="unlikeArticleButton_${article.id}" type="submit">Unlike</button>
            </form>
            <script>
                $("#unlikeArticleButton_${article.id}").click(function() {
                    $.ajax({
                        type: "POST",
                        url: "./unlikeArticle",
                        data: $("#unlikeArticleForm_${article.id}").serialize(),
                        success: function() {
                        }
                    });
                    return false;
                });
            </script>
        </c:if>

        <c:if test="${isUserLoggedIn && article.user.userName.equals(user.userName)}">
            <a href="./editArticlePage?id=${article.id}">edit</a>
            <form action="./deleteArticle?id=${article.id}" method="post">
                <button type="submit">Delete</button>
            </form>
        </c:if>
    </div>
</div>