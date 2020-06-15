<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<di>
    <c:forEach var="comment" items="${article.comments}">
        <div class="my-2" id="comment_${comment.id}" style="margin-left: ${comment.level}00px">
            <small class="font-italic ">
                <c:set var="userSummary" value="${comment.user}"/>
                <%@include file="shared/_userSummary.jsp" %>
                <c:if test="${comment.parentUser != null}">
                    <span>&nbsp;&nbsp;replied&nbsp;&nbsp; </span>
                    <c:set var="userSummary" value="${comment.parentUser}"/>
                    <%@include file="shared/_userSummary.jsp" %>
                    <span class="text-black-50 ml-1">/ ${comment.time}</span>
                </c:if>
            </small>
            <p class="my-0 ml-4">${comment.content}</p>
            <p class="text-justify">${article.content}</p>
            <form id="likeCommentForm_${comment.id}" action="./likeComment" method="post">
                <input type="hidden" name="user" value="${comment.user.id}">
                <input type="hidden" name="comment" value="${comment.id}">
                <button id="likeCommentButton_${comment.id}}" type="submit">Like</button>
            </form>
            <form id="unlikeCommentForm_${comment.id}" action="./unlikeComment" method="post">
                <input type="hidden" name="user" value="${comment.user.id}">
                <input type="hidden" name="comment" value="${comment.id}">
                <button id="unlikeCommentButton_${comment.id}" type="submit">Unlike</button>
            </form>
            <c:if test="${isUserLoggedIn && (user.userName.equals(article.user.userName) || user.userName.equals(comment.user.userName))}">
                <form action="./deleteComment" method="post">
                    <input type="hidden" name="id" value="${comment.id}">
                    <input type="hidden" name="articleId" value="${article.id}">
                    <button type="submit">Delete</button>
                </form>
            </c:if>
            <c:set var="parent" value="${comment}"/>
            <%@include file="shared/_commentBox.jsp" %>
        </div>
    </c:forEach>
</di>
