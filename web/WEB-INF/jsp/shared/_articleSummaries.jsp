<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="list-unstyled">
    <c:forEach items="${articleSummaries}" var="article">
        <div class="card my-2" >
            <div class="row no-gutters">
                <div class="col-sm-3">
                    <img src="./images/cover/${article.cover}" alt="${article.cover}"
                         class="card-img cover-summary" >
                </div>
                <div class="col-sm-9">
                    <div class="card-body">
                        <h5 class="text-dark">
                            <a href="articlePage?id=${article.id}" class="summary-title">${article.title}</a>
                            <span class="article-summary-likes">&nbsp;·&nbsp;${article.likes} like${article.likes == 1 ? "" : "s"}</span>
                        </h5>
                        <p class="my-1 summary-info">
                            <c:set var="userSummary" value="${article.user}"/>
                            <%@include file="_userSummary.jsp" %>
                            <span class="time">&nbsp;${article.time}&nbsp;</span>
                        </p>
                        <p class="my-2">
                            <c:forEach var="tag" items="${article.tags}">
                                <a href="./articlesByTagPage?tag=${tag}" class="badge badge-pill badge-light">${tag}</a>
                            </c:forEach>
                        </p>
                        <c:if test="${isUserLoggedIn && article.user.userName.equals(user.userName)}">
                            <a href="./editArticlePage?id=${article.id}" class="btn btn-sm btn-info">edit</a>
                            <form action="./deleteArticle?id=${article.id}" method="post" class="d-inline">
                                <button type="submit" class="btn btn-sm btn-info">Delete</button>
                            </form>
                        </c:if>
                        <p class="text-justify text-secondary font-weight-light my-0 content-summary">${article.contentSummary}</p>
                    </div>
                </div>
            </div>
        </div>
    </c:forEach>
</div>
