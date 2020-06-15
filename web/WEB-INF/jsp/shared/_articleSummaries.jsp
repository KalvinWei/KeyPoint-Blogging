<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div content="" class="list-unstyled border border-light">
    <c:forEach items="${articleSummaries}" var="article">
        <div class="card my-2" >
            <div class="row no-gutters">
                <div class="col-sm-3">
                    <img src="./images/cover/${article.cover}" alt="${article.cover}"
                         class="card-img" style="object-fit: cover;" >
                </div>
                <div class="col-sm-9">
                    <div class="card-body">
                        <h5 class="text-dark"><a href="articlePage?id=${article.id}">${article.title}</a></h5>
                        <p class="my-1 font-italic"><small><c:set var="userSummary" value="${article.user}"/>
                            <%@include file="_userSummary.jsp" %>
                            / <span>${article.time}</span></small></p>
                        <p class="my-2">
                            <c:forEach var="tag" items="${article.tags}">
                                <a href="./articlesByTagPage?tag=${tag}" class="badge badge-secondary px-1">${tag}</a>
                            </c:forEach>
                        </p>
                        <p class="text-justify text-secondary font-weight-light my-0">${article.contentSummary}</p>
                        <c:if test="${isUserLoggedIn && article.user.userName.equals(user.userName)}">
                            <a href="./editArticlePage?id=${article.id}">edit</a>
                            <form action="./deleteArticle?id=${article.id}" method="post">
                                <button type="submit">Delete</button>
                            </form>
                        </c:if>
                    </div>
                </div>
            </div>
        </div>
    </c:forEach>
</div>
