<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div>
    <c:forEach var="comment" items="${article.comments}">
        <div>
            <%@include file="shared/_userProfileSummary.jsp"%>
            <p>${comment.content}</p>
            <%@include file="_commentCommentBox.jsp"%>
            <c:if test="${isUserLoggedIn && (userProfileSummary.userName == article.userName || userProfileSummary.userName == comment.userName)}">
                <form action="./deleteComment" method="post">
                    <input type="hidden" name="id" value="${comment.id}">
                    <input type="hidden" name="articleId" value="${article.id}">
                    <button type="submit">Delete</button>
                </form>
            </c:if>
        </div>
    </c:forEach>
</div>
