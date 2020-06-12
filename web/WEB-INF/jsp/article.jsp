<%--
  Created by IntelliJ IDEA.
  User: kalvinwei
  Date: 9/06/20
  Time: 16:52
  To change this template use File | Settings | File Templates.

  --from ~/articlePage
  user (id,nickname,avatar)                                        [check article belonging]
  article (id,title,user,time,content,cover,comments[])            [display article, check article belonging]

  # => userProfileSummary !!
  # => article
  # => isUserLoggedIn (boolean)

  --to ~/postComment
  content,time,parent,user,article

  --to ~/deleteComment
  id

--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>${article.userNickname} - ${article.title}</title>
</head>
<body>
<%@include file="shared/navbar.jsp" %>
<div id="wrapper">
    <div id="article">
        <img id="coverImg" src="./images/cover/${article.cover}">
        <h3>${article.title}</h3>
        <p>${article.userNickname} / ${article.time}</p>
        <p>${article.content}</p>
    </div>

    <div id="commentsWrapper">
        <h4>comments</h4>
        <c:if test="${isUserLoggedIn}">
            <img src="./images/avatar/${userProfileSummary.avatar}">
            <form action="./postComment" method="post" class="form">
                <input type="hidden" name="article" value="${article.id}">
                <input type="hidden" name="userName" value="${userProfileSummary.userName}">
                <div class="form-group">
                    <label for="content">Please input your comments:</label>
                    <textarea id="content" name="content" placeholder="Your comments here..."></textarea>
                </div>
                <button type="submit">Post</button>
            </form>
        </c:if>
        <c:if test="${!isUserLoggedIn}">
            <p><a href="./signInPage">sign in to comment on this article</a></p>
        </c:if>
    </div>

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
</div>
</body>
</html>
