<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div id="comments">
    <c:forEach var="comment" items="${article.comments}">
        <div class="commentBox">
            <img src="./images/avatar/${comment.userAvatar}">
            <div>
                <p>${comment.userNickname} / ${comment.time}</p>
                <p>${comment.content}</p>
                <input type="hidden" value="${comment.id}">
                <c:if test="${isUserLoggedIn}">
                    <button onclick="//reply()">reply</button>
                    <c:if test="${userProfileSummary.userName == article.userName || userProfileSummary.userName == comment.userName}">
                        <button onclick="//delete()">delete</button>
                    </c:if>
                </c:if>
            </div>
        </div>
    </c:forEach>
</div>
