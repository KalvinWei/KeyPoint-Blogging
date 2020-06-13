<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div>
    <c:if test="${isUserLoggedIn}">
        <img src="./images/avatar/${user.avatar}" style="width: 20px">
        <form action="./postComment" method="post" class="form">
            <input type="hidden" name="article" value="${article.id}">
            <input type="hidden" name="parent" value="${parent.id}">
            <input type="hidden" name="userName" value="${user.userName}">
            <div class="form-group">
                <label for="content">Comment:</label>
                <textarea id="content" name="content" placeholder="Share your thoughts"></textarea>
            </div>
            <button type="submit">Post</button>
        </form>
    </c:if>
    <c:if test="${!isUserLoggedIn}">
        <p><a href="./signInPage">sign in to comment on this article</a></p>
    </c:if>
</div>
