<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div>
    <c:forEach items="${articleSummaries}" var="article">
        <div>
            <hr />
            <img src="./images/cover/cover1.jpg" alt="${article.cover}" class="img-thumbnail">
            <div>
                <h3><a href="articlePage?id=${article.id}">${article.title}</a></h3>

                <%@include file="_userProfileSummary.jsp"%>

                <span>${article.time}</span>
                <div>
                    <c:forEach var="tag" items="${article.tags}">
                        <span class="badge badge-pill badge-light">${tag}</span>
                    </c:forEach>
                </div>
                <div>
                    <p>${article.contentSummary}</p>
                </div>
                <c:if test="${isUserLoggedIn && article.userName.equals(userProfileSummary.userName)}">
                    <a href="./editArticlePage?id=${article.id}">edit</a>
                    <form action="./deleteArticle?id=${article.id}" method="post">
                        <button type="submit">Delete</button>
                    </form>
                </c:if>
            </div>
        </div>
    </c:forEach>
</div>
