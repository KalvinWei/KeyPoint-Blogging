<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div>
    <c:forEach var="comment" items="${article.comments}">
        <div style="margin-left: ${comment.level}00px">
            <c:set var="userSummary" value="${comment.user}"/>
            <%@include file="shared/_userSummary.jsp"%>
            <p>${comment.content}</p>
            <span>${comment.time}</span>
            <span>Likes: ${comment.likes}</span>
            <c:if test="${isUserLoggedIn && (user.userName.equals(article.user.userName) || user.userName.equals(comment.user.userName))}">
                <form action="./deleteComment" method="post">
                    <input type="hidden" name="id" value="${comment.id}">
                    <input type="hidden" name="articleId" value="${article.id}">
                    <button type="submit">Delete</button>
                </form>
            </c:if>
            <c:set var="parent" value="${comment}"/>
            <%@include file="shared/_commentBox.jsp"%>
        </div>
    </c:forEach>
</div>
