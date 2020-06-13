<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div>
    <c:forEach var="comment" items="${article.comments}">
        <div>
            <c:set var="userSummary" value="${comment.user}"/>
            <%@include file="shared/_userSummary.jsp"%>
            <p>${comment.content}</p>
            <%@include file="_commentCommentBox.jsp"%>
            <c:if test="${isUserLoggedIn && (user.userName.equals(article.user.userName) || user.userName.equals(comment.user.userName))}">
                <form action="./deleteComment" method="post">
                    <input type="hidden" name="id" value="${comment.id}">
                    <input type="hidden" name="articleId" value="${article.id}">
                    <button type="submit">Delete</button>
                </form>
            </c:if>
        </div>
    </c:forEach>
</div>
