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
    <title>${article.userNickname}: ${article.title}</title>
</head>
<body>
<%@include file="shared/navbar.jsp" %>
<div id="wrapper">
    <div id="article">
        <h3>${article.title}</h3>
        <p>${article.userNickname} / ${article.time}</p>
        <p>${article.content}</p>
    </div>
    <div id="commentsWrapper">
        <h4>comments</h4>
        <div id="composeComment">
            <img src="./images/avatar/${userProfileSummary.avatar}">
            <div id="commentBox" class="commentBox">
                <c:if test="${isUserLoggedIn}">
                    <textarea></textarea>
                    <button onclick="//postComment();">post</button>
                </c:if>
                <c:if test="${!isUserLoggedIn}">
                    <p><a href="./signInPage">sign in to comment on this article</a></p>
                </c:if>

            </div>
        </div>

        <div id="comments">
            <c:forEach var="comment" items="${article.commentList}">
                <div class="commentBox">
                    <img src="./images/avatar/${comment.userAvatar}">
                    <div>
                        <p>${comment.userNickname} / ${comment.time}</p>
                        <p>${comment.content}</p>
                        <input type="hidden" value="${comment.id}">
                        <c:if test="${isUserLoggedIn}">
                            <button onclick="//reply()">reply</button>
                            <c:if test="${userProfileSummary.id == article.userId || userProfileSummary.id == comment.userId}">
                                <button onclick="//delete()">delete</button>
                            </c:if>
                        </c:if>
                        <!-- here js deal with if there exists a textarea -->
                        <!-- 2nd level comment box -->
                        <c:forEach var="comment" items="${comment.comments}">
                            <div class="commentBox level-2">
                                <img src="./images/avatar/${comment.userAvatar}">
                                <div>
                                    <p>${comment.userNickname} / ${comment.time}</p>
                                    <p>${comment.content}</p>
                                    <input type="hidden" value="${comment.id}">
                                    <c:if test="${isUserLoggedIn}">
                                        <button onclick="//reply()">reply</button>
                                        <c:if test="${userProfileSummary.id == article.userId || userProfileSummary.id == comment.userId}">
                                            <button onclick="//delete()">delete</button>
                                        </c:if>
                                    </c:if>
                                    <!-- here js deal with if there exists a textarea -->
                                    <!-- 3rd level commnet box -->
                                    <c:forEach var="comment" items="${comment.comments}">
                                        <div class="commentBox level-3">
                                            <img src="./images/avatar/${comment.userAvatar}">
                                            <div>
                                                <p>${comment.userNickname} / ${comment.time}</p>
                                                <p>${comment.content}</p>
                                                <input type="hidden" value="${comment.id}">
                                                <c:if test="${isUserLoggedIn}">
                                                    <button onclick="//reply()">reply</button>
                                                    <c:if test="${userProfileSummary.id == article.userId || userProfileSummary.id == comment.userId}">
                                                        <button onclick="//delete()">delete</button>
                                                    </c:if>
                                                </c:if>
                                                <!-- here js deal with if there exists a textarea -->
                                                <c:forEach var="comment" items="${comment.comments}">

                                                </c:forEach>
                                            </div>
                                        </div>
                                    </c:forEach>
                                </div>
                            </div>
                        </c:forEach>
                    </div>
                </div>
            </c:forEach>
        </div>
    </div>
</div>
</body>
</html>
